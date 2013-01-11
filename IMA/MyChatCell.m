//
//  MyChatCell.m
//  IMA
//
//  Created by Mobytz on 02/01/2013.
//
//

#import "MyChatCell.h"
#import "ProfileViewController.h"

@implementation MyChatCell
@synthesize lblDate,lblMessage,lblUserName,imgProfilePic,imgShape,btnProfileView,imgRightShape,imgBottomShape;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(IBAction)ViewProfile:(id)sender
{
   // ProfileViewController *pView=[[ProfileViewController alloc]initWithNibName:@"ProfileViewController" bundle:nil];
    //pView.btnBack.hidden=NO;
    //[[UIApplication sharedApplication] presentModalViewController:pView animated:YES];
    
    
}

@end
