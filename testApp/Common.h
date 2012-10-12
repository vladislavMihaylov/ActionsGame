
#ifndef COMMON_H
#define COMMON_H

#include <vector>

using namespace std;

typedef struct
{
    float time;
    float angle;
    
}AnimationFrame;

typedef vector<AnimationFrame> AnimationFramePool;

AnimationFrame AFrame(float time, float angle);

#endif