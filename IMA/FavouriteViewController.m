//
//  FavouriteViewController.m
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FavouriteViewController.h"
#import "MyFavouriteCell.h"
@interface FavouriteViewController ()

@end

@implementation FavouriteViewController
@synthesize tblFavourite;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleFavouriteIdentifier = @"MyFavouriteCell";
    
    MyFavouriteCell *cell = (MyFavouriteCell*)[tableView dequeueReusableCellWithIdentifier:simpleFavouriteIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyFavouriteCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    // NSLog(@"at row %i",indexPath.row);
    cell.lblUserName.text=@"Martin";
    cell.lblStatus.text=@"Mystatus";
    
      
    return cell;
}

@end
