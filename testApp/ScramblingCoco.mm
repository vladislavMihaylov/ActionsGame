//
//  JumpingCoco.m
//  morphing
//
//  Created by Vlad on 12.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ScramblingCoco.h"


@implementation ScramblingCoco

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

+ (ScramblingCoco *) createWithSpeed: (float) speed
{
    ScramblingCoco *scramblingCoco = [[[ScramblingCoco alloc] initWithSpeed: speed] autorelease];
    
    return scramblingCoco;
}



@end
