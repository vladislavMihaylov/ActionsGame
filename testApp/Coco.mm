//
//  Coco.m
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Coco.h"

#import "GameConfig.h"

@implementation Coco

@synthesize body;
@synthesize head;
@synthesize rightFoot;
@synthesize leftFoot;
@synthesize rightHand;
@synthesize leftHand;

- (void) dealloc
{
    [super dealloc];
}

- (id) initWithSpeed: (float) speed
{
    if(self = [super init])
    {
        currentCoco = [CurrentCoco createWithSpeed: 0];

        swimmingCoco = [SwimmingCoco createWithSpeed: 0];
        
        runningCoco = [RunningCoco createWithSpeed: 0];
        
        [self addChild: currentCoco];
        [self addChild: swimmingCoco];
        [self addChild: runningCoco];
        
        runningCoco.scale = 0;
        swimmingCoco.scale = 0;
        
    }
    
    return self;
}

- (void) doAction: (NSInteger) numberOfAction withSpeed: (float) speed
{
    if(numberOfAction == 0)
    {
        currentAction = runningAction;
        currentCoco.body.frames = runningCoco.body.frames;
        currentCoco.head.frames = runningCoco.head.frames;
        currentCoco.leftHand.frames = runningCoco.leftHand.frames;
        currentCoco.rightHand.frames = runningCoco.rightHand.frames;
        currentCoco.rightFoot.frames = runningCoco.rightFoot.frames;
        currentCoco.leftFoot.frames = runningCoco.leftFoot.frames;
        
        [currentCoco increaseSpeed];
    }
    else if(numberOfAction == 1)
    {
        currentAction = swimmingAction;
        currentCoco.body.frames = swimmingCoco.body.frames;
        currentCoco.head.frames = swimmingCoco.head.frames;
        currentCoco.leftHand.frames = swimmingCoco.leftHand.frames;
        currentCoco.rightHand.frames = swimmingCoco.rightHand.frames;
        currentCoco.rightFoot.frames = swimmingCoco.rightFoot.frames;
        currentCoco.leftFoot.frames = swimmingCoco.leftFoot.frames;
        
        [currentCoco increaseSpeed];
    }
    else if(numberOfAction == 2)
    {
        if(currentAction != swimmingAction)
        {
            ICanJump = NO;
            [currentCoco runAction: [CCJumpTo actionWithDuration: 0.7 position: currentCoco.position height: 150 jumps: 1]];
            [self runAction:
                    [CCSequence actions:
                                [CCDelayTime actionWithDuration: 0.7],
                                [CCCallFunc actionWithTarget: self
                                                    selector: @selector(solveJump)],
                     nil]
             ];
        }
    }
}

- (void) solveJump
{
    ICanJump = YES;
}

- (void) increaseSpeed
{
    [body increaseSpeedAnimation];
    [head increaseSpeedAnimation];
    [rightHand increaseSpeedAnimation];
    [leftHand increaseSpeedAnimation];
    [rightFoot increaseSpeedAnimation];
    [leftFoot increaseSpeedAnimation];
}

+ (Coco *) createWithSpeed: (float) speed
{
    Coco *coco = [[[Coco alloc] initWithSpeed: speed] autorelease];
    
    return coco;
}

@end
