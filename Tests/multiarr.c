int main()
{
	int arr[3][4][5];
	int i,j,k;

	for(i=0;i<3;i=i+1)
	{
		for(j=0;j<4;j=j+1)
		{
			for(k=0;k<5;k=k+1)
			{
				arr[i][j][k] = 100*i + 10*j + k;
			}
		}
	}

	for(i=0;i<3;i=i+1)
	{
		for(j=0;j<4;j=j+1)
		{
			for(k=0;k<5;k=k+1)
			{
				printf(arr[i][j][k]);
			}
		}
	}
}