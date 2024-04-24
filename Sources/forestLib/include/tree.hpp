#pragma once

#include "core.hpp"

enum class TreeKind {
  Oak,
  Redwood,
  Willow
};

class FOREST_API Tree {
public:
  Tree(TreeKind kind);
private:
  TreeKind kind;
};
