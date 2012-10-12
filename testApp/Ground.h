//
//  Ground.h
//  morphing
//
//  Created by Vlad on 09.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Ground: CCNode
{
    CCSprite *ground;
    
    NSMutableArray *groundsArray;
    
    float time;                     // Счетчик времени
    NSInteger nextFrameNumber;      // Номер следующего кадра
    
    float speed;                    // Скорость анимации
    
    float distance;
}

+ (Ground *) create;

- (void) increaseSpeedAnimation: (float) speed;

@end
