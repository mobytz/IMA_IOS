//
//  MyTableViewCell.m
//  IMA
//
//  Created by Mobytz on 01/01/2013.
//
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
@synthesize lblPost,lblTimeofPost,btnComment;


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

@end
