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
  int data1[16];
  int data2[16];
  for (int i = 0; i < 24; i++) {
    sw[i] = sw_value & (1 << i);
    led[i] = led_value & (1 << i);
  }
  int firstBit = 0;
  bool flag = true;
  if (sw[23] == 0 && sw[22] == 0 && sw[21] == 0) {
    for (int i = 0; i < 16; i++) {
      if (sw[i] == 1) {
        *led24 = *led24 | (~(1 << i));
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
          *led24 = *led24 | (~(1 << i));
        }
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        if (sw[i] == 1) {
          *led24 = *led24 | (~(1 << i));
        }
      }
    }
  } else if (sw[23] == 0 && sw[22] == 1 && sw[21] == 0) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] & data2[i]) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  } else if (sw[23] == 0 && sw[22] == 1 && sw[21] == 1) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] | data2[i]) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  } else if (sw[23] == 1 && sw[22] == 0 && sw[21] == 0) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] ^ data2[i]) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  } else if (sw[23] == 1 && sw[22] == 0 && sw[21] == 0) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    // char a[32];
    int b;
    // for (int i = 0; i < 16; i++) {
    //   a[i] = data1[i] + '0';
    // }
    for (int i = 0; i < 16; i++) {
      b = b + (data2[i] << i);
    }
    for (int i = 0; i < b; i++) {
      for (int j = 15; j > 0; j--) {
        data1[j] = data1[j - 1];
      }
      data1[0] = 0;
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] == 1) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  } else if (sw[23] == 1 && sw[22] == 1 && sw[21] == 0) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    // char a[32];
    int b;
    // for (int i = 0; i < 16; i++) {
    //   a[i] = data1[i] + '0';
    // }
    for (int i = 0; i < 16; i++) {
      b = b + (data2[i] << i);
    }
    for (int i = 0; i < b; i++) {
      for (int j = 0; j < 15; j++) {
        data1[j] = data1[j + 1];
      }
      data1[15] = 0;
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] == 1) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  } else if (sw[23] == 1 && sw[22] == 1 && sw[21] == 1) {
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data1[i] = sw[i];
      }
    }
    while (sw[20] == 0) {
    }
    while (sw[20] == 1) {
      for (int i = 0; i < 16; i++) {
        data2[i] = sw[i];
      }
    }
    // char a[32];
    int b;
    // for (int i = 0; i < 16; i++) {
    //   a[i] = data1[i] + '0';
    // }
    for (int i = 0; i < 16; i++) {
      b = b + (data2[i] << i);
    }
    for (int i = 0; i < b; i++) {
      for (int j = 0; j < 15; j++) {
        data1[j] = data1[j + 1];
      }
    }
    for (int i = 0; i < 16; i++) {
      if (data1[i] == 1) {
        *led24 = *led24 | (~(1 << i));
      }
    }
  }
}
