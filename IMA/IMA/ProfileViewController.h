//
//  ProfileViewController.h
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain) IBOutlet UITableView *tblRecentPosts;
@property(nonatomic,retain) IBOutlet UIButton *btnBack;
@property(nonatomic,retain) IBOutlet UIImageView *imgProfile;

-(IBAction)back:(id)sender;

@end
