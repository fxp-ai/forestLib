#pragma once

#ifdef _WIN32
#define API __declspec(dllexport)
#else
#define API
#endif

enum class TreeKind {
  Oak,
  Redwood,
  Willow
};

class API Tree {
public:
  Tree(TreeKind kind);
private:
  TreeKind kind;
};
