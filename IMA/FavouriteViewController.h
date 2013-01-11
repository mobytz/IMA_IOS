//
//  FavouriteViewController.h
//  IMA
//
//  Created by Zachariah Tom on 01/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouriteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray * _rows,*itemArray,*kArray;
    NSArray * _nib;

}
@property(nonatomic,retain) IBOutlet UITableView *tblFavourite;

@property(nonatomic,retain) NSMutableArray *itemArray,*kArray;

@property(nonatomic,retain) IBOutlet UIToolbar *favToolBar;

//@property(nonatomic,retain) NSMutableArray *itemArray;

@end
