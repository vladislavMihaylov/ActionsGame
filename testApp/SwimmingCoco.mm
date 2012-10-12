//
//  SwimmingCoco.m
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SwimmingCoco.h"


@implementation SwimmingCoco

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
        CGPoint positionBody = ccp(160, 240);
        CGPoint anchorBody = ccp(0.5, 0.4);
        NSInteger zBody = 2;
        
        CGPoint positionHead = ccp(75, 200);
        CGPoint anchorHead = ccp(0.5, 0.0);
        
        CGPoint positionRightHand = ccp(75, 150);
        CGPoint anchorRightHand = ccp(0.5, 1.0);
        
        CGPoint positionLeftHand = ccp(75, 150);
        CGPoint anchorLeftHand = ccp(0.5, 1.0);
        
        CGPoint positionRightFoot = ccp(75, 50);
        CGPoint anchorRightFoot = ccp(0.5, 1.0);
        
        CGPoint positionLeftFoot = ccp(75, 50);
        CGPoint anchorLeftFoot = ccp(0.5, 1.0);
        
        body = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"body.png"] position: positionBody anchorPoint: anchorBody andSpeed: speed];
        [body addFrame: AFrame(0, 80)];
        [body addFrame: AFrame(1, 78)];
        [body addFrame: AFrame(2, 80)];
        [body addFrame: AFrame(3, 82)];
        [body addFrame: AFrame(4, 80)];
        
        head = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"head.png"]  position: positionHead anchorPoint: anchorHead andSpeed: speed];
        [head addFrame: AFrame(0, 0)];
        [head addFrame: AFrame(1, 5)];
        [head addFrame: AFrame(2, 0)];
        [head addFrame: AFrame(3, -5)];
        [head addFrame: AFrame(4, 0)];
        
        rightHand = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"rightHand.png"]  position: positionRightHand anchorPoint: anchorRightHand andSpeed: speed];
        [rightHand addFrame: AFrame(0, 0)];
        [rightHand addFrame: AFrame(1, 90)];
        [rightHand addFrame: AFrame(2, 180)];
        [rightHand addFrame: AFrame(3, 270)];
        [rightHand addFrame: AFrame(4, 360)];
        
        leftHand = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"leftHand.png"]  position: positionLeftHand anchorPoint: anchorLeftHand andSpeed: speed];
        [leftHand addFrame: AFrame(0, 180)];
        [leftHand addFrame: AFrame(1, 270)];
        [leftHand addFrame: AFrame(2, 360)];
        [leftHand addFrame: AFrame(3, 450)];
        [leftHand addFrame: AFrame(4, 540)];
        
        rightFoot = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"rightFoot.png"]  position: positionRightFoot anchorPoint: anchorRightFoot andSpeed: speed];
        [rightFoot addFrame: AFrame(0, 0)];
        [rightFoot addFrame: AFrame(1, 10)];
        [rightFoot addFrame: AFrame(2, 0)];
        [rightFoot addFrame: AFrame(3, -15)];
        [rightFoot addFrame: AFrame(4, 0)];
        
        leftFoot = [AnimationNode createWithSprite: [CCSprite spriteWithFile: @"leftFoot.png"]  position: positionLeftFoot anchorPoint: anchorLeftFoot andSpeed: speed];
        [leftFoot addFrame: AFrame(0, 0)];
        [leftFoot addFrame: AFrame(1, -15)];
        [leftFoot addFrame: AFrame(2, 0)];
        [leftFoot addFrame: AFrame(3, 10)];
        [leftFoot addFrame: AFrame(4, 0)];
        
        body.position = positionBody;
        head.position = positionHead;
        rightHand.position = positionRightHand;
        leftHand.position = positionLeftHand;
        rightFoot.position = positionRightFoot;
        leftFoot.position = positionLeftFoot;
        
        
        [self addChild: body z: zBody];
        [body addChildToNode: head withZ: 1];
        [body addChildToNode: rightHand withZ: 1];
        [body addChildToNode: leftHand withZ: -1];
        [body addChildToNode: rightFoot withZ: 1];
        [body addChildToNode: leftFoot withZ: -1];
        

    }
    
    return self;
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

+ (SwimmingCoco *) createWithSpeed: (float) speed
{
    SwimmingCoco *swimmingCoco = [[[SwimmingCoco alloc] initWithSpeed: speed] autorelease];
    
    return swimmingCoco;
}

@end
