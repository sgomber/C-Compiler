int main()
{
	int arr[20];
	arr[0] = 1;
	arr[1] = 1;

	int i;
	for(i=2;i<20;i=i+1)
	{
		arr[i]=arr[i-1]+arr[i-2];

		if(i==5)
		{
			break;
		}
		printf(arr[i]);
	}

}