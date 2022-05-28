//
// Created by dgy on 2022/5/28.
//

#define bool int
#define true 1
#define false 0

volatile int *sw24 = (int *)0xFFFFFFF0;
volatile int *led24 = (int *)0xFFFFFF00;

extern int main() {
  while (1) {
    if (*sw24 & (1 << 20)) {
      for (int i = 0; i < 23; i++) {
        *led24 = *led24 | (1 << i);
      }
    }
    else *led24 = *led24 & (~(1 << 23));
  }
}