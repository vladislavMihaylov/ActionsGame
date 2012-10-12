//
//  SwimmingCoco.h
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "AnimationNode.h"

@interface SwimmingCoco : CCNode 
{
    AnimationNode *body;
    AnimationNode *head;
    AnimationNode *rightHand;
    AnimationNode *leftHand;
    AnimationNode *rightFoot;
    AnimationNode *leftFoot;
}

+ (SwimmingCoco *) createWithSpeed: (float) speed;
- (void) increaseSpeed;

@property (nonatomic, assign) AnimationNode *body;
@property (nonatomic, assign) AnimationNode *head;
@property (nonatomic, assign) AnimationNode *rightHand;
@property (nonatomic, assign) AnimationNode *leftHand;
@property (nonatomic, assign) AnimationNode *rightFoot;
@property (nonatomic, assign) AnimationNode *leftFoot;

@end
