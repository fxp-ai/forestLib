#pragma once

#ifdef _WIN32
#define API __declspec(dllexport)
#else
#define API
#endif

#include <string>

API void printSomething(const std::string &something);
API int add(int a, int b);