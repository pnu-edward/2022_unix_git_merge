#include <stdio.h>
int add(int a, int b);
long long mul(int a, int b);

int main() {
	char c;
	int a, b;
	scanf("%c %d %d", &c, &a, &b);
	switch(c) {
		case '*': printf("%lld\n", mul(a,b)); break;
	}
}

