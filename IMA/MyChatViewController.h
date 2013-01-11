//
//  MyChatViewController.h
//  IMA
//
//  Created by Mobytz on 10/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface MyChatViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * _rows,*itemArray;
    NSArray * _nib;

}

@property(nonatomic,retain) IBOutlet UITableView *tblChat;

@property(nonatomic,retain) NSMutableArray *itemArray,*kArray;

@property(nonatomic,retain) IBOutlet UIToolbar *chatToolBar;


@end
