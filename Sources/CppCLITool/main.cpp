#include <iostream>

#include "SwiftLib/SwiftLib-Swift.h"

int main() {
  std::cout << "Hello, C++" << std::endl;
  int32_t a = 20, b = 30;
  int32_t c = SwiftLib::addNumbers(a, b);
  std::cout << "The number is: " << c <<  std::endl;
  SwiftLib::sayHello("Felix");
}