//
//  SocialTabViewController.h
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
@class UserProfile;
@class Profile;
#import <UIKit/UIKit.h>
#import <KKGridView/KKGridView.h>
@interface SocialTabViewController : UIViewController<KKGridViewDataSource,KKGridViewDelegate>
@property (nonatomic,retain) NSMutableArray *arrayProfilesNearby;
@property (nonatomic,retain) NSMutableArray *arrayProfilesAway;
@property(nonatomic,retain)UserProfile *myUser;
@property(nonatomic,retain) KKGridView *gridview;
-(IBAction)goToUserProfile:(id)sender;
@end
