//
//  MyChatCell.h
//  IMA
//
//  Created by Mobytz on 02/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface MyChatCell : UITableViewCell
{
    UIImage *imgShape;
    UIImageView*imgProfilePic;
    UILabel *lblUserName;
    UILabel *lblDate;
    UILabel *lblMessage;
    UIButton *btnProfileView;
    
}
@property(nonatomic,retain) IBOutlet UIImage *imgShape;

@property(nonatomic,retain) IBOutlet UIImageView *imgProfilePic;

@property(nonatomic,readonly) IBOutlet UILabel *lblUserName;

@property(nonatomic,readonly) IBOutlet UILabel *lblDate;

@property(nonatomic,readonly) IBOutlet UILabel *lblMessage;

@property(nonatomic,readonly) IBOutlet UIButton *btnProfileView;
-(IBAction)ViewProfile:(id)sender;

@end
