//
//  ProfileViewController.m
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"
#import "MyTableViewCell.h"
#import "UIScrollView+AH3DPullRefresh.h"
@interface ProfileViewController ()

@end

@implementation ProfileViewController
//NSArray *arrPosts;
//NSArray *thumbnails;
@synthesize tblRecentPosts;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Profile", @"Profile");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
    //arrPosts = [NSArray arrayWithObjects:@"Hai",@"Hello",@"Its Cool out here!!",@"Hello World",@"lkhj",@"Kgjhgfjhg",@"hjgjhgjhg",@"kjhkhkj",@"ftrysuyu",@"ktuidesfg",nil];
    NSLog(@"hello");
    //self.btnBack.hidden=YES;
	// Do any additional setup after loading the view, typically from a nib.
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
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
    
}


-(IBAction)back:(id)sender
{
    self.btnBack.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
           static NSString *simpleTableIdentifier = @"MyTableViewCell";
        
        MyTableViewCell *cell = (MyTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            
        }
    
      cell.lblPost.text = [NSString stringWithFormat:@"Post %i........",indexPath.row];
    
      // tableView.backgroundColor=[UIColor blackColor];
        //cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
        //cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
        
        return cell;
}


@end
