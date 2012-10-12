//
//  HelloWorldLayer.m
//  testApp
//
//  Created by Mac on 17.09.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "Common.h"
#import "GameLayer.h"
#import "Coco.h"


// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}

- (void) dealloc
{
	[super dealloc];
}

-(id) init
{
	if( (self=[super init])) {
		
		CCMenuItemFont *play = [CCMenuItemFont itemFromString: @"PLAY" target: self selector: @selector(play:)];
        play.position = ccp(160, 160);
        
        CCMenu *menu = [CCMenu menuWithItems: play, nil];
        menu.position = ccp(0,0);
        [self addChild: menu];
	}
	return self;
}

- (void) play: (id) sender
{
    [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration: 1 scene: [GameLayer scene]]];
}


@end
