//
//  Environment.m
//  HelloCocos
//
//  Created by Mohammad Azam on 12/14/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import "Environment.h"
#import "Scoreboard.h" 


@implementation Environment 

@synthesize layer;

-(Environment *) initWithLayer:(CCLayer *) l
{
	self = [super init]; 
	self.layer = l; 
	
	return self; 
}

-(void) displayGameOverMessage
{

	CCLabel *label = [[CCLabel alloc] initWithString:@"Game Over" fontName:@"Marker Felt" fontSize:26];
	label.position = ccp(windowSize.width/2, windowSize.height/2); 
	[self.layer addChild:label];
	
}

-(void) preloadSounds
{
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"fireball.png"];
	[[SimpleAudioEngine sharedEngine] preloadEffect:@"laser.wav"];
	
}

-(void) removeLifeByTag:(int) tag
{
	if(tag > 0) 
	{
	NSLog(@"removeLifeByTag tag = %d",tag);
	[self.layer removeChildByTag:tag cleanup:YES];
	}
}

-(void) pauseGame:(id) sender 
{
	BOOL isPaused = [[CCDirector sharedDirector] isPaused];
	
	if(!isPaused) 
	{
		// pause the game
		ccColor4B c = {100,100,0,100}; 
		PauseLayer *pauseLayer = [[[PauseLayer alloc] initWithColor:c] autorelease]; 
		[self.layer.parent addChild:pauseLayer z:10 tag:100]; 
		[[CCDirector sharedDirector] pause];
			
	}
	
}


-(void) drawPauseAndPlayButtons
{
	CCMenuItemImage *menuItem1 = [CCMenuItemImage itemFromNormalImage:@"red_button.png" selectedImage:@"red_button.png" target:self selector:@selector(pauseGame:)];
		
	CCMenu *menu = [CCMenu menuWithItems:menuItem1,nil]; 
	menu.position = ccp(windowSize.width - menuItem1.contentSize.width,windowSize.height - menuItem1.contentSize.height); 
	[self.layer addChild:menu];
}

-(void) drawLives:(int) lives 
{
	// draw the lives 
	int x = 0; 
	
	for (int i=1; i<=lives; i++) {

		CCSprite *life = [CCSprite spriteWithFile:@"small_spaceship.png"];
		[life setTag:i];
		life.position = ccp(x + life.contentSize.width,windowSize.height - life.contentSize.height); 
		[self.layer addChild:life];
		x = x + life.contentSize.width; 
	}
	
}

-(void) setup 
{
	
	 int x=0; 
	 int y = 0; 
	 
	CCParticleFire *emitter = [[CCParticleFire alloc]init];
	
	 CGSize windowSize = [[CCDirector sharedDirector] winSize];
	 
	 y = windowSize.height + 50; 
	 
	 NSLog(@"emitter content size %f",emitter.texture.contentSize.width);
	 
	 int noOfFireBallsNeeded = windowSize.width / emitter.texture.contentSize.width;
	 
	 NSLog(@"no of fireballs needed to make a sea of fire %d",noOfFireBallsNeeded);
	 
	 for(int i=1; i<=noOfFireBallsNeeded;i++) 
	 {
	 CCParticleFire *seaOfFire = [[CCParticleFire alloc] init];
	 
	 [seaOfFire setStartSize:10];
	 [seaOfFire setEmissionRate:10];
	 [seaOfFire setLife:20];
	 [seaOfFire setGravity:ccp(0,-90)];
	 seaOfFire.position = ccp(x,y); 
	 
		
	[self.layer addChild:seaOfFire z:-1];
	 
	 x += emitter.texture.contentSize.width; 
	 
	 }
	 
	// preload sounds
	[self preloadSounds];
	
		// draw pause and play buttons 
	[self drawPauseAndPlayButtons]; 

	
}

@end
