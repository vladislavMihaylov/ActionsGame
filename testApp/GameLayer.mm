//
//  MyCocos2DClass.m
//  morphing
//
//  Created by Vlad on 09.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "GameConfig.h"

#import "Coco.h"
#import "Ground.h"

@implementation GameLayer

+ (CCScene *) scene
{
    CCScene *scene = [CCScene node];
    
    GameLayer *layer = [GameLayer node];
    
    [scene addChild: layer];
    
    return scene;
}

- (void) dealloc
{
    [super dealloc];
}

- (id) init
{
    if (self = [super init])
    {
        Coco *coco = [Coco createWithSpeed: currentSpeed];
        [self addChild: coco];
        
        coco.scale = 0.3;
        coco.position =ccp(80, 105);
        
        
        Ground *ground = [Ground create];
        [self addChild: ground];
        
        currentSpeed = 0;
        
        // Buttons 
        
        CCMenuItemFont *runBtn = [CCMenuItemFont itemFromString: @"Run!" block:^(id sender)
        {
            currentSpeed += 0.5;
            [coco doAction: 0 withSpeed: currentSpeed];
            [ground increaseSpeedAnimation: currentSpeed];
        }];
        runBtn.position = ccp(50, 30);
        
        CCMenuItemFont *swimBtn = [CCMenuItemFont itemFromString: @"Swim!" block:^(id sender)
        {
            currentSpeed += 0.5;
            [coco doAction: 1 withSpeed: currentSpeed];
            [ground increaseSpeedAnimation: currentSpeed];
        }];
        swimBtn.position = ccp(150, 30);
        
        CCMenuItemFont *jumpBtn = [CCMenuItemFont itemFromString: @"Jump!" block:^(id sender)
        {
            if(ICanJump)
            {
                [coco doAction: 2 withSpeed: currentSpeed];
            }
        }];
        jumpBtn.position = ccp(250, 30);
        
        CCMenu *buttonsMenu = [CCMenu menuWithItems: runBtn, swimBtn, jumpBtn, nil];
        buttonsMenu.position = ccp(0,0);
        [self addChild: buttonsMenu];
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void) update: (float) dt
{
    currentSpeed -= 1.5 * dt;
    
    
    if(currentSpeed <= 0)
    {
        currentSpeed = 0;
    }
    if(currentSpeed > 9)
    {
        currentSpeed = 9;
    }
}

@end
