int g;

void incr(int n)
{
	g=g+n;
}

void decr(int f)
{
	g=g-f;
}

int main()
{
	g=1;
	incr(2);
	incr(3);
	incr(3);
	incr(3);

	decr(-1);
	decr(13);



	printf(g);
}