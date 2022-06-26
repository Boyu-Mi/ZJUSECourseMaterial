#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

typedef unsigned int dwrd;

union Data
{
	float f;
	dwrd d;
}u;

char* ftoa(dwrd d)	//float_change function
{
	char *result_str = (char *)malloc(sizeof(char) * 100);
	int i, j, k;
	i = 0;
	int e;
	dwrd m;

	//special cases
	if (d == 0x7F800000)
	{
		strcpy(result_str, "INF");
		return result_str;
	}
	else if (d == 0xFF800000)
	{
		strcpy(result_str, "-INF");
		return result_str;
	}
	else if (d == 0)
	{
		strcpy(result_str, "0");
		return result_str;
	}

	e = (d >> 23) & 0XFF;
	m = d & 0X7FFFFF;

	char binary_str[100];
	char m_str[25];
	char m_str_tmp[25];
	itoa(m, m_str_tmp, 2);
	strcpy(m_str + 23 - strlen(m_str_tmp), m_str_tmp);
	for (i = 0; i < 23 - strlen(m_str_tmp); i++)
		m_str[i] = '0';

	if (e - 127 >= 0)
	{
		binary_str[0] = '1';
		j = 0;
		for (i = 1; i < e - 126; i++)
			binary_str[i] = m_str[j++];
		binary_str[i++] = '.';
		while (j < 23)
		{
			binary_str[i++] = m_str[j++];
		}
		binary_str[i] = '\0';
	}
	else
	{
		binary_str[0] = '0';
		binary_str[1] = '.';
		for (i = 2; i <= abs(e - 127); i++)
			binary_str[i] = '0';
		binary_str[i++] = '1';
		j = 0;
		while (j < 23)
		{
			binary_str[i++] = m_str[j++];
		}
		binary_str[i] = '\0';
	}

	dwrd d_int = 0;
	float d_float = 0;

	for (i = 0; binary_str[i] != '.'; i++) {}
	for (j = i - 1, k = 0; j >= 0; j--, k++)
		d_int += (binary_str[j] - '0') * pow(2, k);
	for (j = i + 1, k = -1; binary_str[j] != '\0'; j++, k--)
		d_float += (binary_str[j] - '0') * pow(2, k);

	float result = (d & 0X80000000) ? -(d_int + d_float) : (d_int + d_float);

	gcvt(result, 10, result_str);	//change the float result into a string

	return result_str;
}

dwrd atof_hex(char *string)	//string_change function
{
	//special cases
	if (string[0] == '0' && string[1] == '\0')
		return 0;
	if (strcmp(string, "INF") == 0)
		return 0x7F800000;
	if (strcmp(string, "-INF") == 0)
		return 0xFF800000;

	int i, j;
	dwrd str_int = 0;
	float str_float = 0;
	int s, e;
	i = (string[0] == '-') ? 1 : 0;

	if (i == 0)		//positive number
		s = 0;
	else	//negative number
		s = 1;

	while (string[i] != '\0' && string[i] != '.')
	{
		str_int = str_int * 10 + string[i] - '0';
		i++;
	}

	if (string[i] != '\0')
		i++;
	int times = 10;
	while (string[i] != '\0')
	{
		str_float += (float)(string[i] - '0') / times;
		times *= 10;
		i++;
	}

	char binary_str[100];

	itoa(str_int, binary_str, 2);

	if (str_int != 0)
	{
		e = strlen(binary_str) - 1 + 127;
	}

	int ptr = strlen(binary_str);
	binary_str[ptr++] = '.';

	float tmp = str_float;
	int len = 0;
	times = 1;
	while (tmp)
	{
		i = (int)(tmp * 2);
		binary_str[ptr++] = i + '0';
		times *= 10;
		tmp = tmp * 2 - i;
		len++;
		if (len >= 45)
			break;
	}
	binary_str[ptr] = '\0';

	if (str_int == 0)
	{
		int e_tmp = 0;
		for (i = 2; ; i++)
		{
			if (binary_str[i] == '0')
				e_tmp++;
			else
				break;
		}
		e = -(e_tmp + 1) + 127;
	}

	char result_str[100];
	result_str[0] = s + '0';

	char e_str[10];
	char e_str_tmp[10];
	itoa(e, e_str_tmp, 2);
	strcpy(e_str + 8 - strlen(e_str_tmp), e_str_tmp);
	for (i = 0; i < 8 - strlen(e_str_tmp); i++)
		e_str[i] = '0';

	char m_str[25];
	if (str_int != 0)
	{
		j = 0;
		for (i = 1; binary_str[i] != '\0' && i <= 24; i++)
		{
			if (binary_str[i] == '.')
				continue;
			m_str[j++] = binary_str[i];
		}
		if (i <= 24)
		{
			while (j <= 22)
			{
				m_str[j++] = '0';
			}
		}
		m_str[j] = '\0';
	}
	else
	{
		for (i = 2; ; i++)
			if (binary_str[i] != '0')
				break;
		i++;
		j = 0;
		while (j < 23 && binary_str[i] != '\0')
		{
			m_str[j++] = binary_str[i++];
		}
		if (j < 23)
		{
			while (j <= 22)
			{
				m_str[j++] = '0';
			}
		}
		m_str[j] = '\0';
	}

	//special cases
	if (s == 0 && e == 255 && atol(m_str) == 0)
	{
		printf("INF\n");
		return 0;
	}
	else if (s == 1 && e == 255 && atol(m_str) == 0)
	{
		printf("-INF\n");
		return 0;
	}
	else if (e == 255 && atol(m_str) != 0)
	{
		printf("NaN\n");
		return 0;
	}

	for (i = 1; i <= 8; i++)
		result_str[i] = e_str[i - 1];
	for (i = 9; i <= 31; i++)
		result_str[i] = m_str[i - 9];
	result_str[32] = '\0';

	dwrd result = 0;
	for (i = 0; i <= 31; i++)
		result += (result_str[i] - '0') << (31 - i);

	return result;
}

dwrd fadd(dwrd d1, dwrd d2)		//add fuction with |d1| > |d2|
{
	int e1, e2;
	dwrd m1, m2;

	e1 = (d1 >> 23) & 0xFF;
	m1 = (d1 & 0x7FFFFF) | 0x800000;	//or 0x800000 to get a 1 on the left end
	e2 = (d2 >> 23) & 0xFF;
	m2 = (d2 & 0x7FFFFF) | 0x800000;

	m2 >>= (e1 - e2);

	if ((d1 ^ d2) & 0x80000000)		//one positive and one negative
	{
		m1 -= m2;
		while ((m1 & 0x800000) == 0)
		{
			m1 <<= 1;
			e1--;
		}
	}

	else	//both positive or negative
	{
		m1 += m2;
		while (m1 & 0xFF000000)		//if there is carryout, shift right
		{
			m1 >>= 1;
			e1++;
		}
	}

	return (d1 & 0x80000000) | (e1 << 23) | (m1 & 0x7FFFFF);
}

dwrd fsub(dwrd d1, dwrd d2)		//subtract function
{
	int e1, e2;
	dwrd m1, m2;

	e1 = (d1 >> 23) & 0xFF;
	m1 = (d1 & 0x7FFFFF) | 0x800000;
	e2 = (d2 >> 23) & 0xFF;
	m2 = (d2 & 0x7FFFFF) | 0x800000;

	if (fabs(atof(ftoa(d1))) > fabs(atof(ftoa(d2))))
	{
		m2 >>= (e1 - e2);

		if ((d1 ^ d2) & 0x80000000)		//one positive and one negative
		{
			m1 += m2;
			while (m1 & 0xFF000000)		//if there is carryout, shift right
			{
				m1 >>= 1;
				e1++;
			}
			if ((d1 & 0x80000000) && ((d2 & 0x80000000) == 0))	//negative - positive
				return 0x80000000 | (e1 << 23) | (m1 & 0x7FFFFF);
			else if ((d2 & 0x80000000) && ((d1 & 0x80000000) == 0))		//positive - negative
				return 0x00000000 | (e1 << 23) | (m1 & 0x7FFFFF);
		}

		else	//both positive or negative
		{
			m1 -= m2;
			while ((m1 & 0x800000) == 0)
			{
				m1 <<= 1;
				e1--;
			}
			if (atof(ftoa(d1)) > atof(ftoa(d2)))
				return 0x00000000 | (e1 << 23) | (m1 & 0x7FFFFF);
			else
				return 0x80000000 | (e1 << 23) | (m1 & 0x7FFFFF);
		}
	}
	else
	{
		m1 >>= (e2 - e1);

		if ((d1 ^ d2) & 0x80000000)		//one positive and one negative
		{
			m2 += m1;
			while (m2 & 0xFF000000)		//if there is carryout, shift right
			{
				m2 >>= 1;
				e2++;
			}
			if ((d1 & 0x80000000) && ((d2 & 0x80000000) == 0))	//negative - positive
				return 0x80000000 | (e2 << 23) | (m2 & 0x7FFFFF);
			else if ((d2 & 0x80000000) && ((d1 & 0x80000000) == 0))		//positive - negative
				return 0x00000000 | (e2 << 23) | (m2 & 0x7FFFFF);
		}

		else	//both positive or negative
		{
			m2 -= m1;
			while ((m2 & 0x800000) == 0)
			{
				m2 <<= 1;
				e2--;
			}
			if (atof(ftoa(d1)) > atof(ftoa(d2)))
				return 0x00000000 | (e2 << 23) | (m2 & 0x7FFFFF);
			else
				return 0x80000000 | (e2 << 23) | (m2 & 0x7FFFFF);
		}
	}
}

dwrd fmul(dwrd d1, dwrd d2)		//multiply function
{
	int e1, e2;
	dwrd m1, m2;
	dwrd n1, n2;

	e1 = (d1 >> 23) & 0xFF;
	m1 = (d1 & 0x7FFFFF) | 0x800000;
	e2 = (d2 >> 23) & 0xFF;
	m2 = (d2 & 0x7FFFFF) | 0x800000;

	e1 = e1 + e2 - 127;
	n1 = n2 = 0;
	while (m2 != 0)
	{
		n2 >>= 1;
		if (n1 & 1)
			n2 |= 0x80000000;
		n1 >>= 1;
		if (m2 & 1)
			n1 += m1;
		m2 >>= 1;
	}
	while (n1 & 0xFF000000)	//if there is carryout, shift right
	{
		n1 >>= 1;
		e1++;
	}

	return ((d1 ^ d2) & 0x80000000) | (e1 << 23) | (n1 & 0x7FFFFF);
}

dwrd fdiv(dwrd d1, dwrd d2)		//divide function, which is the opposite of the multiply function
{
	int e1, e2;
	dwrd m1, m2;
	dwrd n1, n2;
	
	//since d1 / d2 = d1 * 1/d2, we can use the same way of fmul to solve fdiv
	u.d = d2;
	u.f = 1 / u.f;
	d2 = u.d;	//now d2 is actually 1 / d2

	e1 = (d1 >> 23) & 0xFF;
	m1 = (d1 & 0x7FFFFF) | 0x800000;
	e2 = (d2 >> 23) & 0xFF;
	m2 = (d2 & 0x7FFFFF) | 0x800000;

	e1 = e1 + e2 - 127;
	n1 = n2 = 0;
	while (m2 != 0)
	{
		n2 >>= 1;
		if (n1 & 1)
			n2 |= 0x80000000;
		n1 >>= 1;
		if (m2 & 1)
			n1 += m1;
		m2 >>= 1;
	}
	while (n1 & 0xFF000000)	//if there is carryout, shift right
	{
		n1 >>= 1;
		e1++;
	}

	return ((d1 ^ d2) & 0x80000000) | (e1 << 23) | (n1 & 0x7FFFFF);
}

int main()
{
	int op;
	dwrd d1, d2, d3;

	printf("Choose the operation you want to take:\n");
	printf("1.Change a string into float number in IEEE754 format.\n");
	printf("2.Change a float number in IEEE754 format into string.\n");
	printf("3.Add.\n");
	printf("4.Subtract.\n");
	printf("5.Multiply.\n");
	printf("6.Divide.\n");
	printf("0.Exit.\n");

	scanf("%d", &op);

	while (op != 0)
	{
		char *str = (char *)malloc(sizeof(char) * 100);
		char *str1 = (char *)malloc(sizeof(char) * 100);
		char *str2 = (char *)malloc(sizeof(char) * 100);
		switch (op)
		{
		case 1: printf("Enter a string.\n");
			scanf("%s", str);
			d1 = atof_hex(str);
			printf("0X%8X\n", d1);
			printf("\n");
			break;
		case 2: printf("Enter a float number in IEEE754 format(hex).\n");
			scanf("%X", &d1);
			str = ftoa(d1);
			printf("%s\n", str);
			printf("\n");
			break;
		case 3: printf("Enter the first float number.\n");
			scanf("%s", str1);
			d1 = atof_hex(str1);
			printf("Enter the second float number.\n");
			scanf("%s", str2);
			d2 = atof_hex(str2);
			if (fabs(atof(str1)) > fabs(atof(str2)))
				d3 = fadd(d1, d2);
			else
				d3 = fadd(d2, d1);
			str = ftoa(d3);
			printf("%s(0X%8X) + %s(0X%8X) = %s(0X%8X)\n", str1, d1, str2, d2, str, d3);
			printf("\n");
			break;
		case 4: printf("Enter the first float number.\n");
			scanf("%s", str1);
			d1 = atof_hex(str1);
			printf("Enter the second float number.\n");
			scanf("%s", str2);
			d2 = atof_hex(str2);
			d3 = fsub(d1, d2);
			str = ftoa(d3);
			printf("%s(0X%8X) - %s(0X%8X) = %s(0X%8X)\n", str1, d1, str2, d2, str, d3);
			printf("\n");
			break;
		case 5: printf("Enter the first float number.\n");
			scanf("%s", str1);
			d1 = atof_hex(str1);
			printf("Enter the second float number.\n");
			scanf("%s", str2);
			d2 = atof_hex(str2);
			d3 = fmul(d1, d2);
			str = ftoa(d3);
			printf("%s(0X%8X) * %s(0X%8X) = %s(0X%8X)\n", str1, d1, str2, d2, str, d3);
			printf("\n");
			break;
		case 6: printf("Enter the first float number.\n");
			scanf("%s", str1);
			d1 = atof_hex(str1);
			printf("Enter the second float number.\n");
			scanf("%s", str2);
			d2 = atof_hex(str2);
			d3 = fdiv(d1, d2);
			str = ftoa(d3);
			printf("%s(0X%8X) / %s(0X%8X) = %s(0X%8X)\n", str1, d1, str2, d2, str, d3);
			printf("\n");
			break;
		default: printf("Invalid input!");
			printf("\n");
			break;
		}

		printf("Choose the operation you want to take:\n");
		printf("1.Change a string into float number in IEEE754 format(hex).\n");
		printf("2.Change a float number in IEEE754 format into string.\n");
		printf("3.Add.\n");
		printf("4.Subtract.\n");
		printf("5.Multiply.\n");
		printf("6.Divide.\n");
		printf("0.Exit.\n");

		scanf("%d", &op);
	}

	system("pause");
	return 0;
}
