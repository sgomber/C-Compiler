int fib(int n)
{
	if(n==0 || n==1)
	{
		return 1;
	}
	return fib(n-1)+fib(n-2);
}

int main()
{
	int x;
	x=6;
	printf(fib(x,2));

	int a[-1][2];

	a[-1][1]=2;
}