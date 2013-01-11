//
//  MyChatViewController.m
//  IMA
//
//  Created by Mobytz on 10/01/2013.
//
//

#import "MyChatViewController.h"
#import "classUser.h"
#import "MyChatCell.h"
#import "UIScrollView+AH3DPullRefresh.h"
#import "ProfileViewController.h"
@interface MyChatViewController ()

@end

@implementation MyChatViewController
@synthesize tblChat,chatToolBar;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Chat", @"Chat");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    chatToolBar.barStyle=UIBarStyleBlack;
    // Do any additional setup after loading the view from its nib.
    
    itemArray=[[NSMutableArray alloc] initWithObjects:[classUser UserwithUid:@"user1" Name:@"jim" ProfileImage:[UIImage imageNamed:@"Male1.png"] Work:@"GTechni" Age:[NSNumber numberWithInt:32] RelatioStatus:@"Single" Status:@"Available" userGender:@"Male" userLocation:@"Manchester"],[classUser UserwithUid:@"User2" Name:@"Elena" ProfileImage:[UIImage imageNamed:@"Female1.png"] Work:@"YYY" Age:[NSNumber numberWithInt:25] RelatioStatus:@"In a relationship" Status:@"Available" userGender:@"Female" userLocation:@"West Sussex"] ,[classUser UserwithUid:@"User3" Name:@"Marie" ProfileImage:[UIImage imageNamed:@"Female2.png"] Work:@"ggg" Age:[NSNumber numberWithInt:29] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Norfolk"],[classUser UserwithUid:@"User4" Name:@"Piery" ProfileImage:[UIImage imageNamed:@"Female3.png"] Work:@"qwe" Age:[NSNumber numberWithInt:35] RelatioStatus:@"In a relationship" Status:@"Available" userGender:@"Female" userLocation:@"Highland"],[classUser UserwithUid:@"User5" Name:@" Aijin John" ProfileImage:[UIImage imageNamed:@"Male2.png"] Work:@"qwe" Age:[NSNumber numberWithInt:23] RelatioStatus:@"Single" Status:@"Available" userGender:@"Male" userLocation:@"Birmingham"],[classUser UserwithUid:@"User6" Name:@" Terry" ProfileImage:[UIImage imageNamed:@"Male3.png"] Work:@"Insurance" Age:[NSNumber numberWithInt:32] RelatioStatus:@"Open" Status:@"Available" userGender:@"Male" userLocation:@"Lancashire"],[classUser UserwithUid:@"User7" Name:@" Donald" ProfileImage:[UIImage imageNamed:@"Male4.png"] Work:@"Hotel" Age:[NSNumber numberWithInt:35] RelatioStatus:@"In a relationship" Status:@"Available" userGender:@"Male" userLocation:@"Yorkshire"],[classUser UserwithUid:@"User8" Name:@" Catherene" ProfileImage:[UIImage imageNamed:@"Female4.png"] Work:@"Photographer" Age:[NSNumber numberWithInt:28] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Salford"],[classUser UserwithUid:@"User9" Name:@" Annie" ProfileImage:[UIImage imageNamed:@"Female5.png"] Work:@"BlahBlah" Age:[NSNumber numberWithInt:30] RelatioStatus:@"Single" Status:@"Available" userGender:@"Female" userLocation:@"Derbyshire"], nil];
    
    // Do any additional setup after loading the view from its nib.
    
    _rows = [[NSMutableArray alloc] initWithCapacity:itemArray.count];
    for (NSUInteger i = 0; i < itemArray.count; i++) {
        [_rows addObject:[itemArray objectAtIndex:i]];
    }
    // Set the pull to refresh handler block
    
    [tblChat setPullToRefreshHandler:^{
        NSArray *newRows = [NSArray arrayWithObjects:
                             [itemArray objectAtIndex:rand()%9],
                             [itemArray objectAtIndex:rand()%9], nil];
        [self performSelector:@selector(dataDidRefresh:) withObject:newRows afterDelay:5.0];
        
    }];

    
}


- (void)dataDidRefresh:(NSArray *)data {
    
    // Warn the table view that the refresh did finish
    // _Refreshed=YES;
    [tblChat refreshFinished];
    
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
    [tblChat insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    [tblChat reloadData];
    [indexPaths release];

}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        //[self.games removeObjectAtIndex:indexPath.row];
        [_rows removeObjectAtIndex:indexPath.row];
        //[itemArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
    
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_rows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleChatIdentifier = @"MyChatCell";
    
    NSLog(@"ROW is(In cell)%d",indexPath.row);
    
    NSLog(@"ROW is(In cell@)%d",_rows.count);
    
    
    classUser *User=[_rows objectAtIndex:indexPath.row];
    MyChatCell *cell = (MyChatCell*)[tableView dequeueReusableCellWithIdentifier:simpleChatIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];
        nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
        
        
        cell.lblUserName.text=User.userUid;
        cell.imgProfilePic.image=User.imgProfilePic;
        if(User.userGender==@"Male")
        {
            cell.imgShape.image=[UIImage imageNamed:@"CyanTriangle.png"];
            cell.imgRightShape.image=[UIImage imageNamed:@"CyanShape.png"];
            cell.imgBottomShape.image=[UIImage imageNamed:@"Cyan.png"];
        }
        else
        {
            cell.imgShape.image=[UIImage imageNamed:@"PinkTriangle.png"];
            cell.imgRightShape.image=[UIImage imageNamed:@"PinkShape.png"];
            cell.imgBottomShape.image=[UIImage imageNamed:@"Pinkline.png"];

        }
        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        NSString *now = [dateFormatter stringFromDate:[NSDate date]];
        cell.lblMessage.text=[NSString stringWithFormat:@"Chat Meassage***** ###### ∞∞                                               £££££  %i",indexPath.row];
        cell.lblDate.text=now;
    }
    
    
    // NSLog(@"at row %i",indexPath.row);
    [cell.btnProfileView addTarget:self action:@selector(viewProfile:) forControlEvents:UIControlEventTouchUpInside];
    // if(_Refreshed)
    cell.btnProfileView.tag=indexPath.row;
    
    //}
    return cell;
}


-(void)viewProfile:(id)sender
{
    
    [tblChat reloadData];
    ProfileViewController* bh=(ProfileViewController*)[self.tabBarController.viewControllers objectAtIndex:0];
    UIButton *btn= (UIButton*)sender;
    classUser *User=[_rows objectAtIndex:btn.tag];
    bh.imgProfile.image=User.imgProfilePic;
    bh.lblWork.text=User.userWork;
    bh.lblLocation.text=User.userFrom;
    bh.lblUserid.text=User.userUid;
    if(User.userGender==@"Male")
        bh.imgTriangle.image=[UIImage imageNamed:@"CyanTriangle.png"];
    else
        bh.imgTriangle.image=[UIImage imageNamed:@"PinkTriangle.png"];
    
    self.tabBarController.selectedIndex=0;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
