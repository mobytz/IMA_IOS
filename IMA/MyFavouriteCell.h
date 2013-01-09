//
//  MyFavouriteCell.h
//  IMA
//
//  Created by Mobytz on 02/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface MyFavouriteCell : UITableViewCell
{
    UILabel *lblUserName;
    UILabel *lblStatus;
    UILabel *lblDate;
    UIImage *imgProfilePic;
}
@property(nonatomic,readonly) IBOutlet UILabel *lblUserName;

@property(nonatomic,readonly) IBOutlet UILabel *lblStatus;

@property(nonatomic,readonly) IBOutlet UILabel *lblDate;

@property(nonatomic,retain) IBOutlet  UIImage *imgProfilePic;

@end
