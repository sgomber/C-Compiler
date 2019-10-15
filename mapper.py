import sys

def checker(vars, a):
	if a in vars :
		return a
	elif len(a.split('_')) in [3,4]:
		if len(a.split('_')) == 4:
			return "$a" + a.split('_')[-1]
		return a;
	else :
		return "$"+a

def isfloatreg(a):
	if len(a) == 2 and a.startswith('f') and a[1].isdigit():
		return True
	elif len(a.split('_'))==4:
		return True
	else:
		return False

def iswordreg(a):
	if len(a) == 2 and a.startswith('t') and a[1].isdigit():
		return True
	elif len(a.split('_'))==4:
		return True
	else:
		return False

# --------- all the varialbe declaration here ----------

with open (sys.argv[1], "r") as myfile:
    data=myfile.readlines()

print(".data")

vars = []
types = {}
for i in data:
	x = i.split('\n')[0].split(',')
	print(x[0], end=":")
	vars.append(x[0])
	if x[2] != "0":
		print(" .space "+x[2])
	else:
		if(x[1] == "int"):
			print(" .word 0")
			types[x[0]] = "int"
		else :
			types[x[0]] = "float"
			print(" .float 0.0")

print("newline: .asciiz \"\\n\"")
print(".text")
print(".globl main")

# -------- making list of local variables used in each fn---------

with open (sys.argv[2], "r") as myfile:
    icode=myfile.readlines()

localvars = {}

for i in icode:
	y = i.split('\n')[0].split(' ')
	y = list(filter(('').__ne__, y))
	if y[1] == "func" and y[2] == "begin":
		currentFn = y[3]
		localvars[currentFn] = list()
	for j in y:
		if j.endswith("_" + currentFn) and j not in localvars[currentFn]:
			localvars[currentFn].append(j)

# print(localvars)
# ----------------------------------------------------------------

for i in icode:
	y = i.split('\n')[0].split(' ')
	y = list(filter(('').__ne__, y))
	y[0] = 'L'+y[0]
	# print(y)
	if(len(y) < 2):
		continue;
	if y[1] != "func":	
		print(y[0], end=" ")
	if(y[1] == "goto"):		
		y[2] = 'L'+ y[2]																					# goto statemements
		print("b " + y[2], end="")
	elif y[1] == "func":
		if y[2] == "begin":
			counter = 0											# i in $ai initialised to zero.
			currentFn = y[3]
			print(currentFn + ":", end="")
		else:
			print(y[0], end=" ")
			print("jr $ra")
	elif y[1] in ["return", "refparam", "param", "call"]:																# func statements
		if y[1] == "return":
			if len(y)==2:
				print("jr $ra", end="")
			elif iswordreg(y[2]):									# return t0
				print("move $v0, " + checker(vars, y[2]))
				print("jr $ra", end="")
			else:												# return f0
				print("mfc1 $v0, " + checker(vars, y[2]))
				print("jr $ra", end="")
		elif y[1] == "refparam":
			if iswordreg(y[2]):									# refparam t0
				print("move "+checker(vars, y[2])+", $v0", end="")
			else:												# refparam f0
				print("mtc1 $v0, "+checker(vars, y[2]), end="")
				
		elif y[1] == "param":
			if counter == 0:										    # if we're on the first param, move the stack
				z = ""
				size = 108 + len(localvars[currentFn])*4
				print("addi $sp, $sp, -" + str(size))
			else:	
				z = str(counter*4)

			print("sw $a" + str(counter) + ", " + z + "($sp)")			# push the $ai into the stack
			if iswordreg(y[2]):											# load new value in the $ai
				print("move $a" + str(counter) + ", " + checker(vars, y[2]), end="")			# param t0
			else:		
				print("mfc1 $a" + str(counter) + ", " + checker(vars, y[2]), end="")			# param f0
			counter = counter+1
		elif y[1] == "call":
			#push remaining ai
			if counter == 0:										    # if we're on the first param, move the stack
				z = ""
				size = 108 + len(localvars[currentFn])*4
				print("addi $sp,$sp,-" + str(size))
			else:	
				z = str(counter*4)

			for x in range(0, 4-counter):
				print("sw $a" + str(counter+x) + ", " + z + "($sp)")			# push the $ai into the stack
				z = str((counter+x+1)*4)
			#push t0-t9
			for x in range(10):
				print("sw $t" + str(x) + ", " + str(4*(4+x)) + "($sp)")				# push the $ti into the stack
			#push f0-f9 and f20
			for x in range(10):
				print("swc1 $f" + str(x) + ", " + str(4*(14+x)) + "($sp)")			# push the $ti into the stack
			print("swc1 $f20, 96($sp)")												# push the $ti into the stack
			#push s0
			print("sw $s0, 100($sp)")												# push the $ti into the stack
			#push ra
			print("sw $ra, 104($sp)")												# push the $ti into the stack
			#push all variables in this function to stack
			for i, local in enumerate(localvars[currentFn]):
				print("lw $t0, " + local)
				print("sw $t0, " + str(108 + i*4) + "($sp)")						# push the $ti into the stack

			print("jal " + y[2].split(',')[0])
			# restore all the registers
			print("lw $a0, ($sp)")
			print("lw $a1, 4($sp)")
			print("lw $a2, 8($sp)")
			print("lw $a3, 12($sp)")
			#load all variables in this function to stack
			for i, local in enumerate(localvars[currentFn]):
				print("lw $t0, " + str(108 + i*4) + "($sp)")						# load the $ti into the stack
				print("sw $t0, " + local)
			#load ti
			for x in range(0,10):
				print("lw $t" + str(x) + ", " + str(4*(4+x)) + "($sp)")				# restore the $ti from the stack
			#load f0-f9 and f20
			for x in range(10):
				print("lwc1 $f" + str(x) + ", " + str(4*(14+x)) + "($sp)")			# load the $fi into the stack
			print("lwc1 $f20, 96($sp)")												# load the $fi into the stack
			#load s0
			print("lw $s0, 100($sp)")												# load the $s0 into the stack
			#load ra
			print("lw $ra, 104($sp)")												# load the $ra into the stack
			# pop !!	
			size = 108 + len(localvars[currentFn])*4
			print("addi $sp, $sp, " + str(size), end="")
			counter = 0

	elif(y[1].startswith("if")):	
		# print(y)	
		a = y[1].split('(')[1]
		b = y[3].split(')')[0]
		if isfloatreg(a) and isfloatreg(b):													# (f0 < f1)
			operator = {
				"<" : "c.lt.s",
				"<=" : "c.le.s",
				"==" : "c.eq.s",
				">" : "c.lt.s",
				">=" : "c.le.s",
				"!=" : "c.eq.s",
			}
			if y[2] in [">", ">="]:
				a,b = b,a
			print(operator.get(y[2]) + " " + checker(vars, a) + ", " + checker(vars, b))		# if $f2 operator $f4 then code = 1 else code = 0
			if y[2]=="!=":
				print("bc1f L" + y[-1], end="")								# if code == 0 then jump to label
			else:
				print("bc1t L" + y[-1], end="")								# if code == 1 then jump to label
		else:																									# (t0 < t1)
			operator = {
				"<" : "bltz",
				">" : "bgtz",
				"<=" : "blez",
				">=" : "bgez",
				"==" : "beqz",
				"!=" : "bnez",
			}
			if(b[0].isdigit()):
				print("li $s0, " + b)
				print("sub $s0, " + checker(vars,a) + ", $s0")
			else:
				print("sub $s0, " + checker(vars,a) + ", " + checker(vars,b))
			print("     " + operator.get(y[2]) + " $s0, L" + y[-1], end="")  									# we're comparing two registers
	elif y[1].startswith("print"):
		reg = y[1].split(')')[0].split('(')[1]
		print("addi $sp, $sp, -8")
		print("sw $a0, ($sp)")
		print("sw $v0, 4($sp)")
		if(isfloatreg(reg)):
			print("li $v0, 2 \nmov.s $f12, "+checker(vars, reg)+" \nsyscall") # print float value in reg
		else:
			print("li $v0, 1 \nmove $a0, "+checker(vars, reg)+" \nsyscall")	# print int value in reg
		#printing newline
		print("li $v0, 4\nla $a0, newline\nsyscall")
		
		print("lw $a0, ($sp)")
		print("lw $v0, 4($sp)")
		print("addi $sp, $sp, 8", end="")
	elif y[1].startswith("Load"):
		print("la $"+y[2]+", "+y[3], end="")
	else:
		if any('[' in x for x in y):
			y[1]=y[1]+y[2]+y[3]
			a,b = y[1].split('=')
			if y[1][-1]==']':    
				# print("lol")
				t1,t2 = b.split('[')
				t2 = t2.split(']')[0]
				if iswordreg(a):		# t0 = t1[t2]
					print("add $"+ t1+", $"+t1+", $"+t2)
					print("lw $"+a+", ($"+t1+")", end="")
				else:					# f0 = t1[t2]
					print("add $"+ t1+", $"+t1+", $"+t2)
					print("l.s $"+a+", ($"+t1+")", end="")
			else:
				# print("hey")
				t1,t2 = a.split('[')
				t2 = t2.split(']')[0]
				if iswordreg(b):
					print("add $"+ t1+", $"+t1+", $"+t2)
					print("sw $"+b+", ($"+t1+")", end="")
				else:
					print("add $"+ t1+", $"+t1+", $"+t2)
					print("s.s $"+b+", ($"+t1+")", end="")
		elif(len(y) == 4):																			   # assignments
			a = y[-3]
			b = y[-1]
			if(b[0].isdigit() or b[0]=="-"):
				if isfloatreg(a) or isfloatreg(b):
					print("li.s " + checker(vars,a) + ", " + b, end="")
				else:
					print("li " + checker(vars,a) + ", " + b, end="")
			else:
				if b.startswith('ConvertToInt'):
					b = b.split('(')[1].split(')')[0]
					print("cvt.w.s " + checker(vars, b) + ", " + checker(vars, b))																			# "converting float to int"
					print("\tmfc1 " + checker(vars, a) + ", " + checker(vars, b), end="")
				elif b.startswith('ConvertToFloat'):
					b = b.split('(')[1].split(')')[0]
					print("mtc1 " + checker(vars, b) + ", " + checker(vars, a))
					print("\tcvt.s.w " + checker(vars, a) + ", " + checker(vars, a), end="")																# "converting int to float"
				elif a in vars:
					if isfloatreg(a) or isfloatreg(b):
						print("s.s " + checker(vars,b) + ", " + checker(vars,a), end="")				# var = f0
					else:
						print("sw " + checker(vars,b) + ", " + checker(vars,a), end="")					# var = t0
				else :
					if checker(vars,b).startswith("$a"):
						if isfloatreg(a):
							print("mtc1 " + checker(vars,b) + ", " + checker(vars,a), end="")
						else:
							print("move " + checker(vars,a) + ", " + checker(vars,b), end="")
					elif checker(vars,a).startswith("$a"):
						if isfloatreg(b):
							print("mfc1 " + checker(vars,a) + ", " + checker(vars,b), end="")
						else:
							print("move " + checker(vars,a) + ", " + checker(vars,b), end="")
					elif isfloatreg(a) and isfloatreg(b):
						print("mov.s " + checker(vars,a) + ", " + checker(vars,b), end="")				# f0 = f1
					elif isfloatreg(a) or isfloatreg(b):
						print("l.s " + checker(vars,a) + ", " + checker(vars,b), end="")    			# f0 = var
					else:
						if iswordreg(a) and iswordreg(b):
							print("move " + checker(vars,a) + ", " + checker(vars,b), end="")			# t0 = t1 
						else:
							print("lw " + checker(vars,a) + ", " + checker(vars,b), end="")				# t0 = var

		else:
			# print(y)
			a = y[-5]
			b = y[-3]
			opt = y[-2]
			c = y[-1]
			# print(y)
			operator = {
				"+" : "add",
				"-" : "sub",
				"*" : "mul",
			}
			x = " "
			if isfloatreg(a) or isfloatreg(b):
				x = ".s "
			if opt in ["+","-","*"]:
				print(operator.get(opt) + x + checker(vars,a) + ", " + checker(vars,b) + ", " + checker(vars,c), end="")
			else:
				if isfloatreg(a) or isfloatreg(b):
					print("div.s " + checker(vars, a) + ", " + checker(vars, b) + ", " + checker(vars, c))										# f0 = f1 / f2
				else:
					print("div " + checker(vars,b) + ", " + checker(vars,c))							# t0 = t1 / t2
					if(opt == "%"):
						print("mfhi " + checker(vars,a), end="")										# quotient
					else:
						print("mflo " + checker(vars,a), end="")										# remainder
	print()
