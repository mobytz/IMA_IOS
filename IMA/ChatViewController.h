//
//  ChatViewController.h
//  IMA
//
//  Created by Mobytz on 03/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface ChatViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _rows;
    NSArray * _nib;
}
    @end
