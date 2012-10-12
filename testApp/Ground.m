//
//  Ground.m
//  morphing
//
//  Created by Vlad on 09.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Ground.h"


@implementation Ground

- (void) dealloc
{
    [groundsArray release];
    [super dealloc];
}

- (id) init
{
    if(self = [super init])
    {
        groundsArray = [[NSMutableArray alloc] init];
        
        
        for (int i = 0; i < 3; i++)
        {
            ground = [CCSprite spriteWithFile: @"textureEarth.png"];
            ground.position = ccp(240 + 480 * i, 100);
            [self addChild: ground];
            
            [groundsArray addObject: ground];
        }
        
        [self scheduleUpdate];
    }
    
    return self;
}

+ (Ground *) create
{
    Ground *ground = [[[Ground alloc] init] autorelease];
    
    return ground;
}

- (void) increaseSpeedAnimation: (float) currentSpeed
{
    speed = currentSpeed;
}

- (void) showWater
{
    for (CCSprite *currentSprite in groundsArray)
    {
        [self removeChild: currentSprite cleanup: YES];
    }
    
    [groundsArray removeAllObjects];

    for (int i = 0; i < 3; i++)
    {
        ground = [CCSprite spriteWithFile: @"textureWater.png"];
        ground.position = ccp(240 + 480 * i, 100);
        [self addChild: ground];
    
        [groundsArray addObject: ground];
    }
}

- (void) update: (float) dt
{
    
    speed -= 1.5 * dt;
    
    if(speed <= 0)
    {
        speed = 0;
    }
    if(speed > 9)
    {
        speed = 9;
    }
    
    float multiplier = dt * 28 * speed;
    
    time += multiplier;
    
    if(time < 0)
    {
        time = 0;
    }
    
    distance += speed;
    
    if(distance > 1000)
    {
        distance = 0;
        [self showWater];
    }
    
    CCLOG(@"countSpeed: %f", distance);
    
    for (CCSprite *currentSprite in groundsArray)
    {
        currentSprite.position = ccp(currentSprite.position.x - multiplier, currentSprite.position.y);
        
        if(currentSprite.position.x <= - 240)
        {
            currentSprite.position = ccp(currentSprite.position.x + 960, 100);
        }
    }
    

}

@end
