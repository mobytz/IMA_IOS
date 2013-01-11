//
//  UserProfile.m
//  IMA
//
//  Created by Mobytz-002 on 03/01/2013.
//
//
#import "Profile.h"
#import "UserProfile.h"
#import "SocialTabViewController.h"
@interface UserProfile ()

@end

@implementation UserProfile

@synthesize imageViewUser;
@synthesize imageViewUserFullScreen;
@synthesize labelAge;
@synthesize labelGender;
@synthesize labelName;
@synthesize labelStatus;
@synthesize otherUserProfile;
@synthesize  imageMaleOrFemale,imageAtMiddle,imageAtTop,imageAtBottom;
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    self.labelName.text=self.otherUserProfile.name;
    self.labelGender.text=self.otherUserProfile.gender;
    self.labelStatus.text=self.otherUserProfile.status;
    self.labelAge.text=[NSString stringWithFormat:@"%d", self.otherUserProfile.age];
    self.imageViewUser.image =self.otherUserProfile.imageUser;
    
    NSString *maleOrFemaleString=[NSString stringWithFormat:@"%@",self.otherUserProfile.gender];
    NSLog(@"%@",maleOrFemaleString);
    NSString *male=@"Male";
    self.imageMaleOrFemale.image=([maleOrFemaleString isEqualToString: male])?[UIImage imageNamed:@"cornerBlue.png"]:[UIImage imageNamed:@"cornerPink.png"];
    self.imageAtBottom.image=([maleOrFemaleString isEqualToString: male])?[UIImage imageNamed:@"cornerBlue.png"]:[UIImage imageNamed:@"cornerPink.png"];
    self.imageAtMiddle.image=([maleOrFemaleString isEqualToString: male])?[UIImage imageNamed:@"Cyan.png"]:[UIImage imageNamed:@"Pinkline.png"];
    self.imageAtTop.image=([maleOrFemaleString isEqualToString: male])?[UIImage imageNamed:@"Cyan.png"]:[UIImage imageNamed:@"Pinkline.png"];

    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    self.title = NSLocalizedString(@"Social", @"Social");
    self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
UIButton * button;
-(IBAction)imageToFullScreen
{
    imageViewUserFullScreen=[[UIImageView alloc]initWithFrame:CGRectMake(0,42,320,369)];


    imageViewUserFullScreen.image=self.otherUserProfile.imageUser;
    //[UIImage imageNamed:imageName];
    [self.view addSubview:imageViewUserFullScreen];
    imageViewUserFullScreen.hidden=NO;
    [self.view bringSubviewToFront:imageViewUserFullScreen];
    button=[[UIButton alloc]init];
    [self.view bringSubviewToFront:button];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(imageToNormal)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"" forState:UIControlStateNormal];
    [button setBackgroundColor:nil];
    [button setBackgroundImage:nil forState:UIControlStateNormal];
    //[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0,42,320,369);
    [self.view addSubview:button];
    
    
}
-(IBAction)backToSocialPage
{
    [CATransaction begin];
    [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
    CATransition *transition = [CATransition animation];
    [transition setType:kCATransitionMoveIn];
    [transition setSubtype:kCATransitionFromTop];
    [self.navigationController.view.layer addAnimation:transition forKey:@"someAnimation"];
    [self.navigationController popViewControllerAnimated:YES];
    [CATransaction commit];

    
}


-(void)imageToNormal
{
    imageViewUserFullScreen.hidden=YES;
    [self.view sendSubviewToBack:imageViewUserFullScreen];
    [self.view sendSubviewToBack:button];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
           // Do any additional setup after loading the view from its nib.
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
