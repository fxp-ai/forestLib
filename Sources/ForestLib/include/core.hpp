//
//  Header.h
//  
//
//  Created by Felix Pultar on 24.04.2024.
//

#pragma once

#ifdef _WIN32
#define FOREST_API __declspec(dllexport)
#else
#define FOREST_API
#endif
