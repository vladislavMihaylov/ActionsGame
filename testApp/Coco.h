//
//  Coco.h
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "AnimationNode.h"

#import "CurrentCoco.h"
#import "RunningCoco.h"
#import "SwimmingCoco.h"

@interface Coco : CCNode 
{
    CurrentCoco *currentCoco;
    //Coco *coco;
    RunningCoco *runningCoco;
    SwimmingCoco *swimmingCoco;
    
    AnimationNode *body;
    AnimationNode *head;
    AnimationNode *rightHand;
    AnimationNode *leftHand;
    AnimationNode *rightFoot;
    AnimationNode *leftFoot;
    
    NSInteger currentAction;
}

+ (Coco *) createWithSpeed: (float) speed;

- (void) doAction: (NSInteger) numberOfAction withSpeed: (float) speed;

@property (nonatomic, assign) AnimationNode *body;
@property (nonatomic, assign) AnimationNode *head;
@property (nonatomic, assign) AnimationNode *rightHand;
@property (nonatomic, assign) AnimationNode *leftHand;
@property (nonatomic, assign) AnimationNode *rightFoot;
@property (nonatomic, assign) AnimationNode *leftFoot;


@end
