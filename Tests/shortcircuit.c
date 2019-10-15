int isodd(int n)
{
	printf(n);
	return n%2;
}

int main()
{
	if(isodd(2) || isodd(3) || isodd(4))
	{
		printf(100);
	}
}