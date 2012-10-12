

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Common.h"


@interface AnimationNode: CCNode 
{
    CCSprite *spriteNode;           // Спрайт части тела для анимации
    
    float time;                     // Счетчик времени
    NSInteger nextFrameNumber;      // Номер следующего кадра
    
    float speed;                    // Скорость анимации
    
    AnimationFramePool frames;      // Вектор структур с параметрами анимации
}

+ (AnimationNode *) createWithSprite: (CCSprite *) sprite position: (CGPoint) point anchorPoint: (CGPoint) anchorPoint andSpeed: (float) currentSpeed; 

- (void) addFrame: (AnimationFrame) frame;
- (void) addChildToNode: (AnimationNode *) child withZ: (NSInteger) z;
- (void) increaseSpeedAnimation;
- (void) showVector;

@property (nonatomic, assign) AnimationFramePool frames;

@end
