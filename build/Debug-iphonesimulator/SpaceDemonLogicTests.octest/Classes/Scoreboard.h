//
//  Scoreboard.h
//  HelloCocos
//
//  Created by Mohammad Azam on 12/15/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "BaseEntity.h" 

@interface Scoreboard : BaseEntity {

	CCLayer *layer; 
	CCLabel *scoreLabel; 
	int score; 
	
}

@property (nonatomic,retain) CCLabel *scoreLabel; 
@property (nonatomic,retain) CCLayer *layer; 
@property (nonatomic,assign) int score; 

-(void) display;
-(void) update:(int) s; 

@end
