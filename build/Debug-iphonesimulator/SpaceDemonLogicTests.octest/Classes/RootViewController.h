//
//  RootViewController.h
//  HelloCocos
//
//  Created by Mohammad Azam on 11/13/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iAd/iAd.h>
#import "cocos2d.h" 

@interface RootViewController : UIViewController<ADBannerViewDelegate> {

	
	ADBannerView *bannerView; 
	
}

@property (nonatomic,retain) ADBannerView *bannerView; 

@end
