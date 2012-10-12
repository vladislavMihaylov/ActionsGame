//
//  HelloWorldLayer.h
//  testApp
//
//  Created by Mac on 17.09.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer 
{
    CCLabelTTF *label;
}

+(CCScene *) scene;


@end
