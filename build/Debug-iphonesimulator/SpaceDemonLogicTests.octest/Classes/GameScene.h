//
//  GameScene.h
//  HelloCocos
//
//  Created by Mohammad Azam on 11/29/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"; 


@interface GameScene : CCLayer {

	CCSprite *smiley;
	
}

+(id) scene; 

@property (nonatomic,retain) CCSprite *smiley;

@end
