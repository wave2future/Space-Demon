//
//  GameScene.m
//  HelloCocos
//
//  Created by Mohammad Azam on 11/29/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

@synthesize smiley;


+(id) scene 
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	CCSprite *background = [CCSprite spriteWithFile:@"Background3.png"];
	background.anchorPoint = CGPointMake(0, 0);
	
	[layer addChild:background z:-1];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
	
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		
		isTouchEnabled = YES;
		
		CGSize windowSize = [[CCDirector sharedDirector] winSize];
		
		smiley = [CCSprite spriteWithFile:@"smiley.png"];
		smiley.position = ccp(windowSize.width/2,windowSize.height/2); 
		
		[self addChild:smiley];
	
	}
	
	return self;
}

-(void) finishedAnimation 
{
	CGSize windowSize = [[CCDirector sharedDirector] winSize];
	
	double x = arc4random() % 320; 
	double y = arc4random() % 480; 
	
	id moveToAction = [CCMoveTo actionWithDuration:0.9 position:ccp(x,y)]; 
	id moveDone = [CCCallFunc actionWithTarget:self selector:@selector(finishedAnimation)];
	
	[smiley runAction:[CCSequence actions:moveToAction,moveDone,nil]];
	
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
	
    id moveToAction = [CCMoveTo actionWithDuration:0.9 position:location]; 
	id moveDone = [CCCallFunc actionWithTarget:self selector:@selector(finishedAnimation)];
	
	float distance = pow(location.x - smiley.position.x,2) + pow(location.y - smiley.position.y,2); 
	distance = sqrt(distance); 
	
	if(distance < 50) 
	{
		[smiley runAction:[CCScaleBy actionWithDuration:0.9 scale:3]];
	}
	
	
	[smiley runAction:[CCSequence actions:moveToAction,moveDone,nil]];
		
}




@end
