
if [ $# -ne 1  ]
then
	echo "Please provide one argument with valid file for compilation."
	exit 1
fi

if [ ! -f $1 ]
then
	echo "Invalid file name!!"
	exit 1
fi

filename=`echo "$1" | cut -f 1 -d '.'` # Get filename without extension
extension=`echo "$1" | cut -f 2 -d '.'`

if [ ! $extension == "c" ]
then
	echo "Not a C file!!"
	exit 1
fi

ext2="_Vars.txt"
ext3="_ICCode.txt"
ext4="_ASMCode.asm"
f2=${filename}${ext2}
f3=${filename}${ext3}
f4=${filename}${ext4}

bison -d --warning=none parse.y
flex lexical.l
gcc -c -w lex.yy.c
gcc -c -w parse.tab.c
gcc parse.tab.o lex.yy.o -o ex

rm lex.yy.c
rm lex.yy.o
rm parse.tab.c
rm parse.tab.h
rm parse.tab.o

./ex $1 $f3 $f2

if [ $? -eq 139 ]; then
    echo "Compiler gives segmentation fault!!"
    rm $f2
    rm "ex"
    exit 1
fi

if [ -f "Res.txt" ]
then

a=`cat "Res.txt"`
if [ $a -eq "1" ]
then
	python3 mapper.py $f2 $f3> $f4
	# spim -file $f4
	ans=`spim -file $f4`
	finalans=`echo "$ans" | tail -n+6`
	echo "Output :"
	echo "$finalans"
fi
rm "Res.txt"

else
	echo "No result file made!"
fi

rm $f2
rm "ex"

