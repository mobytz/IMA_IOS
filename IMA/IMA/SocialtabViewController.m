//
//  SocialTabViewController.m
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "SocialTabViewController.h"
#import "UserProfile.h"
#import "Profile.h"
@interface SocialTabViewController ()

@end

@implementation SocialTabViewController

@synthesize arrayProfilesAway;
@synthesize gridview;
@synthesize myUser;
@synthesize arrayProfilesNearby;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Social", @"Social");
        self.tabBarItem.image = [UIImage imageNamed:@"1357901293_testimonials.png"];
    }
    return self;
}
-(IBAction)goToUserProfile:(id)sender
{
   
    myUser=[[UserProfile alloc]init
                        ];
    UIButton *btn = (UIButton *)sender;
        
    self.myUser.otherUserProfile=[self.arrayProfilesNearby objectAtIndex:btn.tag];
            
    [self.navigationController pushViewController:myUser animated:YES];
    
}
- (void)viewDidLoad

{

    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    self.arrayProfilesNearby = [NSMutableArray arrayWithObjects:[Profile profileWithName:@"Martin" gender:@"Male" age:21 status:@"Single"imageUser:[UIImage imageNamed:@"martin.png"]],[Profile profileWithName:@"Alice" gender:@"Female" age:19 status:@"Single" imageUser:[UIImage imageNamed:@"Alice.png"]],[Profile profileWithName:@"ManOne" gender:@"Male" age:21 status:@"Single"imageUser:[UIImage imageNamed:@"man1.png"]],[Profile profileWithName:@"ManTwo" gender:@"Male" age:21 status:@"Single"imageUser:[UIImage imageNamed:@"man2.png"]],[Profile profileWithName:@"WomanOne" gender:@"Female" age:23 status:@"Single"imageUser:[UIImage imageNamed:@"woman1.png"]],[Profile profileWithName:@"WomanTwo" gender:@"Female" age:21 status:@"Single"imageUser:[UIImage imageNamed:@"woman2.png"]],nil];
    self.arrayProfilesAway=[NSMutableArray arrayWithObjects:[Profile profileWithName:@"ManThree" gender:@"Male" age:22 status:@"Single"imageUser:[UIImage imageNamed:@"man3.png"]],[Profile profileWithName:@"WomanThree" gender:@"Female" age:19 status:@"In a relationship"imageUser:[UIImage imageNamed:@"woman3.png"]],nil];
 //[Profile profileWithName:@"Martin" gender:@"Male" age:21 status:@"Single"],[Profile profileWithName:@"Alice" gender:@"Female" age:19 status:@"Single"],nil];
    [self viewgrid];

    // Do any additional setup after loading the view from its nib.
}
-(void)viewgrid
{
    gridview = [[KKGridView alloc] init ];
    gridview.frame = CGRectMake(20 , 64, 280, 396);
    gridview.dataSource=self;
    gridview.delegate=self;
    gridview.scrollsToTop = YES;
    gridview.backgroundColor = [UIColor blackColor];
    gridview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    gridview.cellSize = CGSizeMake(65.f, 65.f);
    gridview.cellPadding = CGSizeMake(3.f, 3.f);
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:gridview];
  
}

- (CGFloat)gridView:(KKGridView *)gridView heightForHeaderInSection:(NSUInteger)section
{
    return 23.f;
}

- (NSUInteger)gridView:(KKGridView *)gridView numberOfItemsInSection:(NSUInteger)section
{
    if (section==0)
    {
        
        return [arrayProfilesNearby count];
        
    }
    else return [arrayProfilesAway count];
    
}

- (NSUInteger)numberOfSectionsInGridView:(KKGridView *)gridView
{
    return 2;
}

- (KKGridViewCell *)gridView:(KKGridView *)gridView cellForItemAtIndexPath:(KKIndexPath *)indexPath
{
    KKGridViewCell *cell = [KKGridViewCell cellForGridView:gridView];
    if(indexPath.section==0)
    {
        myUser=[[UserProfile alloc]init
            ];
    self.myUser.otherUserProfile=[self.arrayProfilesNearby objectAtIndex:indexPath.index];
//    NSCharacterSet *nonAlphaNum = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
//	NSString *fileName = [[self.myUser.otherUserProfile.name  componentsSeparatedByCharactersInSet:nonAlphaNum]
//						  componentsJoinedByString:@""];
//    NSLog(@"im 1%@",fileName);
//    NSString *imageName=[NSString stringWithFormat:@"%@.png",fileName];
//    cell.backgroundColor = [UIColor lightGrayColor];
//    NSLog(@"im 2%@",imageName);
    }
    else
    {
        myUser=[[UserProfile alloc]init
                ];
        self.myUser.otherUserProfile=[self.arrayProfilesAway objectAtIndex:indexPath.index];

    }
    UIImageView *imageView=[[UIImageView alloc] initWithImage:self.myUser.otherUserProfile.imageUser];
    imageView.frame = CGRectMake(0, 0, 65, 65);
    UIImageView *imageViewTwo=[[UIImageView alloc] init];
    imageViewTwo.frame=CGRectMake(30,30,35 , 35);
     NSString *maleOrFemaleString=[NSString stringWithFormat:@"%@",self.myUser.otherUserProfile.gender];
    NSString *male=@"Male";
    imageViewTwo.image=([maleOrFemaleString isEqualToString: male])?[UIImage imageNamed:@"cornerBlue.png"]:[UIImage imageNamed:@"cornerPink.png"];
    [imageView addSubview:imageViewTwo];
    [cell.contentView addSubview:imageView];
    
   
    return cell;
}
- (UIView *)gridView:(KKGridView *)gridView viewForHeaderInSection:(NSUInteger)section
{
    if (section==0) {
        UIImageView * myHeader = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Nearby.png"]] autorelease];
        
        return myHeader;
    } else
    {
        UIImageView * myHeader = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bristol.png"]] autorelease];
        return myHeader;
    }
}

- (void)gridView:(KKGridView *)gridView didSelectItemAtIndexPath:(KKIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
            self.myUser.otherUserProfile=[self.arrayProfilesNearby objectAtIndex:indexPath.index];
            
            
    }
    else
    {
         self.myUser.otherUserProfile=[self.arrayProfilesAway objectAtIndex:indexPath.index];
        
    }
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionMoveIn];
    [transition setSubtype:kCATransitionFromBottom];
    [self.myUser.view.layer addAnimation:transition forKey:@"someAnimation"];
    [self.navigationController pushViewController:self.myUser animated:YES];
    [CATransaction commit];

   
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

@end
