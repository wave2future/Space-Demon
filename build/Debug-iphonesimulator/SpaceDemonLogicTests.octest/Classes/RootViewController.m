//
//  RootViewController.m
//  HelloCocos
//
//  Created by Mohammad Azam on 11/13/10.
//  Copyright 2010 HighOnCoding. All rights reserved.
//

#import "RootViewController.h"
#import "HelloWorldScene.h" 

@implementation RootViewController

@synthesize bannerView; 

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	NSLog(@"bannerViewDidLoadAd");
	
	[self moveBannerOnScreen];	
}

-(void) moveBannerOnScreen 
{
	
	[UIView beginAnimations:@"BannerViewIntro" context:NULL];

	self.bannerView.frame = CGRectZero;
	[UIView commitAnimations];
}

-(void) moveBannerOffScreen
{
	CGSize windowSize = [[CCDirector sharedDirector] winSize];
	
	self.bannerView.frame = CGRectMake(0, (-1) * windowSize.height, 320, 50);
	
}


-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	NSLog(@"didFailToReceiveAdWithError");
	
	[self moveBannerOffScreen]; 
	
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	// Obtain the shared director in order to...
	CCDirector *director = [CCDirector sharedDirector];
	
	// Sets landscape mode
	[director setDeviceOrientation:kCCDeviceOrientationPortrait];
	
	// Turn on display FPS
	[director setDisplayFPS:NO];
	
	// Turn on multiple touches
	EAGLView *eaglView = [director openGLView];
	[eaglView setMultipleTouchEnabled:YES];
	[self.view addSubview:eaglView];
	
	static NSString * const kADBannerViewClass = @"ADBannerView";
	if (NSClassFromString(kADBannerViewClass) != nil) {
		
		self.bannerView = [[ADBannerView alloc] initWithFrame:CGRectZero];
		[self.bannerView setRequiredContentSizeIdentifiers:[NSSet setWithObjects:
															ADBannerContentSizeIdentifier320x50,
															ADBannerContentSizeIdentifier480x32, nil]];
		
		self.bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
		
		[self.bannerView setDelegate:self];
		
		[self.view addSubview:self.bannerView];
		[self moveBannerOffScreen];
		
	}
	
	[CCTexture2D setDefaultAlphaPixelFormat:kTexture2DPixelFormat_RGBA8888];
	
	[[CCDirector sharedDirector] runWithScene: [HelloWorld scene]];
	
	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
