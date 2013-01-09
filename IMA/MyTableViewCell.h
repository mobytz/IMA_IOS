//
//  MyTableViewCell.h
//  IMA
//
//  Created by Mobytz on 01/01/2013.
//
//

#import <UIKit/UIKit.h>
//#import "MyTableViewCell.h"

@interface MyTableViewCell : UITableViewCell
{
 UILabel *lblPost;
 UILabel *lblTimeofPost;
 UIButton *btnComment;
}
@property(nonatomic,readonly) IBOutlet UILabel *lblPost;
@property(nonatomic,readonly) IBOutlet UILabel *lblTimeofPost;
@property(nonatomic,readonly) IBOutlet UIButton *btnComment;

@end
