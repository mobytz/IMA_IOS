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

@property(nonatomic,retain) IBOutlet UILabel *lblUserid;

@property(nonatomic,retain) IBOutlet UILabel *lblWork;

@property(nonatomic,retain) IBOutlet UILabel *lblLocation;
@property(nonatomic,retain) IBOutlet UIImageView *imgTriangle;

//@property(nonatomic,retain) IBOutlet


-(IBAction)back:(id)sender;

@end
