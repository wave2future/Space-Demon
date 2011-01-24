//
//  CollisionManager.m
//  HelloCocos
//
//  Created by Mohammad Azam on 12/14/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import "CollisionManager.h"


@implementation CollisionManager

-(BOOL) isCollided:(CCNode *)source objectUnderCollision:(CCNode *)target
{

	/*
	CGRect rect1 = CGRectMake(source.position.x, source.position.y, source.contentSize.width, source.contentSize.height);
	CGRect rect2 = CGRectMake(target.position.x, target.position.y, target.contentSize.width, target.contentSize.height);
	
	if (!CGRectIsNull(CGRectIntersection(rect1, rect2)))
		return YES; 
	return NO; 
	*/
	
	float distance = powf(source.position.x - target.position.x, 2) + powf(source.position.y - target.position.y,2); 
	distance = sqrtf(distance);
	
	if(distance <= target.contentSize.width/2) 
		return YES;
		
	return NO;
	 
}

@end
