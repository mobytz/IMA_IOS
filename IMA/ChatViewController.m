//
//  ChatViewController.m
//  IMA
//
//  Created by Mobytz on 03/01/2013.
//
//

#import "ChatViewController.h"
#import "MyChatCell.h"
#import "UIScrollView+AH3DPullRefresh.h"
#import "ProfileViewController.h"


#define kDataArray [NSArray arrayWithObjects:@"Ate", @"Bacchus Moon", @"Bel'Shir", @"Bivouac", @"Brutus", @"Canis", @"Chanuk", @"Dark moon", @"Edis", @"Ehlna", @"Ender", @"Eris", @"Gohbus Moon", @"Haji", @"Hermes", @"Kaldir", @"Luna", @"Monlyth", @"Orson", @"Paralta Moon", @"Pyramus", @"Roxara's moon", @"Saalok", @"Sue", @"Thisby", @"Thunis", @"Treason", @"Ulaan", @"Ursa", @"Urthos III", @"Valhalla", @"Vito", @"Worthing", nil]
#define kImageArray [NSArray arrayWithObjects:@"Martin.png",@"Male1.png", @"Male2.png", @"Female1.png", @"Female2.png", @"Female3.png", nil]
#define kRowsInitSize 15

@interface ChatViewController ()
- (void)dataDidRefresh:(NSArray *)data;
//- (void)dataDidLoadMore:(NSArray *)data;
@end

@implementation ChatViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Chat", @"Chat");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
     
    _rows = [[NSMutableArray alloc] initWithCapacity:kRowsInitSize];
    for (NSUInteger i = 0; i < kRowsInitSize; i++) {
        [_rows addObject:[kDataArray objectAtIndex:rand()%33]];
    }
    
    // Set the pull to refresh handler block
    [self.tableView setPullToRefreshHandler:^{
        NSArray * newRows = [NSArray arrayWithObjects:
                             [kDataArray objectAtIndex:rand()%33],
                             [kDataArray objectAtIndex:rand()%33], nil];
        [self performSelector:@selector(dataDidRefresh:) withObject:newRows afterDelay:5.0];
        
    }];
    
    /**
     Note: Here you should deal perform a webservice request, CoreData query or
     whatever instead of this dummy code ;-)
     */

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)dataDidRefresh:(NSArray *)data {
    
    // Warn the table view that the refresh did finish
    [self.tableView refreshFinished];
    
    // Insert the objects at the first positions in the rows array
    NSIndexSet * indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [data count])];
    //[_rows insertObjects:data atIndexes:indexSet];                'jk
    
    _nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];
    static NSString *simpleChatIdentifier = @"MyChatCell";
    NSMutableArray *cellArray=[[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < [data count]; i++)
    {
        MyChatCell *cell = (MyChatCell*)[self.tableView dequeueReusableCellWithIdentifier:simpleChatIdentifier];
        cell = [_nib objectAtIndex:0];
        [cell.btnProfileView addTarget:self action:@selector(viewProfile:)  forControlEvents:UIControlEventTouchUpInside];
        cell.imgProfilePic.image=[UIImage imageNamed:[kImageArray objectAtIndex:rand()%5]];
        [cellArray addObject:cell];
    }

    [_rows insertObjects:cellArray atIndexes:indexSet];                     //jk
    
    // Obtain the index paths where to insert the rows in the table view
    NSMutableArray * indexPaths = [[NSMutableArray alloc] initWithCapacity:[cellArray count]];
    for (NSUInteger i = 0; i < [cellArray count]; i++) {                           //jk
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:0]];   //jk
    }
    
    // Insert the new data in the table view
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    /*for(int i = 0;i<cellArray.count;i++){
        NSIndexPath *myPath=[NSIndexPath indexPathForRow:10-i inSection:0];
        
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:myPath] withRowAnimation:UITableViewRowAnimationFade];
    }*/
    [indexPaths release];
}

-(void)viewProfile
{
  
    ProfileViewController* bh=(ProfileViewController*)[self.tabBarController.viewControllers objectAtIndex:0];
    bh.imgProfile.image=[UIImage imageNamed:@"Cyan.png"];
    self.tabBarController.selectedIndex=0;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        //[self.games removeObjectAtIndex:indexPath.row];
        [_rows removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_rows count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIToolbar *tbChat=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    tbChat.barStyle=UIBarStyleBlack;
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexspace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexspace];

    UIBarButtonItem *btnCompose=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:nil];
    [barItems addObject:btnCompose];
    [tbChat setItems:barItems];
    [barItems release];
    UIImageView *imgTitle=[[UIImageView alloc]initWithFrame:CGRectMake(120, 0, 60,20)];
    imgTitle.image=[UIImage imageNamed:@"Chat.png"];
    [tbChat addSubview:imgTitle];
    return  tbChat;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleChatIdentifier = @"MyChatCell";
    
    MyChatCell *cell = (MyChatCell*)[tableView dequeueReusableCellWithIdentifier:simpleChatIdentifier];
    if (cell == nil)
    {
       // NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];
        _nib = [[NSBundle mainBundle] loadNibNamed:@"MyChatCell" owner:self options:nil];

        cell = [_nib objectAtIndex:0];
        cell.lblUserName.text=[kDataArray objectAtIndex:rand()%33];
        cell.imgProfilePic.image=[UIImage imageNamed:[kImageArray objectAtIndex:rand()%5]];
        NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        NSString *now = [dateFormatter stringFromDate:[NSDate date]];
        cell.lblMessage.text=[NSString stringWithFormat:@"Chat Meassage***** ###### ∞∞                                               £££££  %i",indexPath.row];
        cell.lblDate.text=now;
        
    }
    
    // NSLog(@"at row %i",indexPath.row);
    [cell.btnProfileView addTarget:self action:@selector(viewProfile) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
