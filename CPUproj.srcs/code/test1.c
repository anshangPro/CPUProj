//
// Created by dgy on 2022/5/27.
//
#include <memory.h>
#include <stdio.h>
#include <stdlib.h>

#define bool int
#define true 1
#define false 0

// led[23]用于判定是否为回文数
// sw[20]用来判断读取结束
// 可以换成其他键位，修改即可

volatile int *sw24 = (int *)0xFFFFFFF0;
volatile int *led24 = (int *)0xFFFFFF00;

int main() {
  int sw_value = *sw24;
  int led_value = *led24;
  int sw[24];
  int led[24];
  for (int i = 0; i < 24; i++) {
    sw[i] = sw_value & (1 << i);
    led[i] = led_value & (1 << i);
  }
  int firstBit = 0;
  bool flag = true;
  if (sw[23] == 0 && sw[22] == 0 && sw[21] == 0) {
    for (int i = 0; i < 16; i++) {
      if (sw[i] == 1) {
        *led24 = *led24 | (~(1 << 23));
      }
    }
    for (int i = 15; i >= 0; i--) {
      if (sw[i] == 1) {
        firstBit = i;
        break;
      }
    }
    if (firstBit & 0x1) {
      for (int i = firstBit; i >= (firstBit + 1) >> 1; i++) {
        if (sw[i] != sw[firstBit - i]) {
          flag = false;
        }
      }
      if (flag) {
        *led24 = *led24 | (~(1 << 23));
      }
    }
  } else if (sw[23] == 0 && sw[22] == 0 && sw[21] == 1) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        if (sw[i] == 1) {
          *led24 = *led24 | (~(1 << 23));
        }
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        if (sw[i] == 1) {
          *led24 = *led24 | (~(1 << 23));
        }
      }
    }
  }
}
