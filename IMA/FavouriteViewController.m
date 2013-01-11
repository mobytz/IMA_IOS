//
//  FavouriteViewController.m
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FavouriteViewController.h"
#import "MyFavouriteCell.h"
#import "classUser.h"
#import "UIScrollView+AH3DPullRefresh.h"
@interface FavouriteViewController ()

@end

@implementation FavouriteViewController
@synthesize tblFavourite,itemArray,favToolBar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Favorite", @"Favorite");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
[super viewDidLoad];
    itemArray=[[NSMutableArray alloc] initWithObjects:[classUser UserwithUid:@"user1" Name:@"jim" ProfileImage:[UIImage imageNamed:@"Male1.png"] Work:@"GTechni" Age:[NSNumber numberWithInt:32] RelatioStatus:@"Single" Status:@"Available" userGender:@"Male" userLocation:@"Manchester"],[classUser UserwithUid:@"User2" Name:@"Elena" ProfileImage:[UIImage imageNamed:@"Female1.png"] Work:@"YYY" Age:[NSNumber numberWithInt:25] RelatioStatus:@"In a relationship" Status:@"Busy" userGender:@"Female" userLocation:@"West Sussex"] ,[classUser UserwithUid:@"User3" Name:@"Marie" ProfileImage:[UIImage imageNamed:@"Female2.png"] Work:@"ggg" Age:[NSNumber numberWithInt:29] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Norfolk"],[classUser UserwithUid:@"User4" Name:@"Piery" ProfileImage:[UIImage imageNamed:@"Female3.png"] Work:@"qwe" Age:[NSNumber numberWithInt:35] RelatioStatus:@"In a relationship" Status:@"Available" userGender:@"Female" userLocation:@"Highland"],[classUser UserwithUid:@"User5" Name:@" Aijin John" ProfileImage:[UIImage imageNamed:@"Male2.png"] Work:@"qwe" Age:[NSNumber numberWithInt:23] RelatioStatus:@"Single" Status:@"Available" userGender:@"Male" userLocation:@"Birmingham"],[classUser UserwithUid:@"User6" Name:@" Terry" ProfileImage:[UIImage imageNamed:@"Male3.png"] Work:@"Insurance" Age:[NSNumber numberWithInt:32] RelatioStatus:@"Open" Status:@"Available" userGender:@"Male" userLocation:@"Lancashire"],[classUser UserwithUid:@"User7" Name:@" Donald" ProfileImage:[UIImage imageNamed:@"Male4.png"] Work:@"Hotel" Age:[NSNumber numberWithInt:35] RelatioStatus:@"In a relationship" Status:@"Busy" userGender:@"Male" userLocation:@"Yorkshire"],[classUser UserwithUid:@"User8" Name:@" Catherene" ProfileImage:[UIImage imageNamed:@"Female4.png"] Work:@"Photographer" Age:[NSNumber numberWithInt:28] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Salford"],[classUser UserwithUid:@"User9" Name:@" Annie" ProfileImage:[UIImage imageNamed:@"Female5.png"] Work:@"BlahBlah" Age:[NSNumber numberWithInt:30] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Derbyshire"], nil];

    // Do any additional setup after loading the view from its nib.
    
    _rows = [[NSMutableArray alloc] initWithCapacity:itemArray.count];
    for (NSUInteger i = 0; i < itemArray.count; i++) {
        [_rows addObject:[itemArray objectAtIndex:i]];
    }
    // Set the pull to refresh handler block
    [tblFavourite setPullToRefreshHandler:^{
        NSArray * newRows = [NSArray arrayWithObjects:
                             [itemArray objectAtIndex:rand()%9],
                             [itemArray objectAtIndex:rand()%9], nil];
        [self performSelector:@selector(dataDidRefresh:) withObject:newRows afterDelay:5.0];
        
    }];

}


- (void)dataDidRefresh:(NSArray *)data {
    
    // Warn the table view that the refresh did finish
   // _Refreshed=YES;
    [tblFavourite refreshFinished];
    
    // Insert the objects at the first positions in the rows array
      
    _nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];
      NSLog(@"Row size is ->%d",_rows.count);
    for (NSUInteger i = 0; i < [data count]; i++)
    {
        classUser *User=[data objectAtIndex:i];
        [itemArray insertObject:User atIndex:i];
        [_rows insertObject:User atIndex:i];
    }
    
        // Obtain the index paths where to insert the rows in the table view
    NSMutableArray * indexPaths = [[NSMutableArray alloc] initWithCapacity:[data count]];
    for (NSUInteger i = 0; i < [data count]; i++) {                           //jk
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];//jk
        
    }
    
    // Insert the new data in the table view
    [tblFavourite insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        [tblFavourite reloadData];
    [indexPaths release];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _rows.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 114;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleFavouriteIdentifier = @"MyFavouriteCell";
    classUser *User=[_rows objectAtIndex:indexPath.row];
    
    MyFavouriteCell *cell = (MyFavouriteCell*)[tableView dequeueReusableCellWithIdentifier:simpleFavouriteIdentifier];
    if (cell == nil)
    {
        //NSLog(@"Row num->%d",indexPath.row);
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyFavouriteCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.imgProfilePic.image=User.imgProfilePic;
        cell.lblStatus.text=User.userState;
        cell.lblUserName.text=User.userOrigName;

        if(User.userGender==@"Male")
        {
            cell.imgTriangle.image=[UIImage imageNamed:@"CyanTriangle.png"];
            cell.imgRightShape.image=[UIImage imageNamed:@"CyanShape.png"];
            cell.imgBottomShape.image=[UIImage imageNamed:@"Cyan.png"];

        }
        else
        {
            cell.imgTriangle.image=[UIImage imageNamed:@"PinkTriangle.png"];
            cell.imgRightShape.image=[UIImage imageNamed:@"PinkShape.png"];
            cell.imgBottomShape.image=[UIImage imageNamed:@"Pinkline.png"];

        }
        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        NSString *now = [dateFormatter stringFromDate:[NSDate date]];
        cell.lblDate.text=now;

        
        
    }
    
    // NSLog(@"at row %i",indexPath.row);
   // cell.lblUserName.text=@"Martin";
    //cell.lblStatus.text=@"Mystatus";
    
    
      
    return cell;
}

@end
