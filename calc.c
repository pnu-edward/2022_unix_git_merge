#include <stdio.h>
long long add(int a, int b);

int main() {
	char c;
	int a, b;
	scanf("%c %d %d", &c, &a, &b);
	switch(c){
		case '+': printf("%lld\n", add(a, b)); break;
	}
}

