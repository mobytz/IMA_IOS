//
//  UserProfile.h
//  IMA
//
//  Created by Mobytz-002 on 03/01/2013.
//
//

#import <UIKit/UIKit.h>
#import <quartzcore/quartzcore.h>

@class Profile;
@interface UserProfile : UIViewController
@property(nonatomic,retain) IBOutlet UIImageView *imageViewUser;
@property(nonatomic,retain) UIImageView *imageViewUserFullScreen;
@property(nonatomic,retain) IBOutlet UILabel *labelName;
@property(nonatomic,retain) IBOutlet UILabel *labelAge;
@property(nonatomic,retain) IBOutlet UILabel *labelGender;
@property(nonatomic,retain) IBOutlet UILabel *labelStatus;
@property(nonatomic,retain) IBOutlet UIImageView *imageMaleOrFemale;
@property(nonatomic,retain) IBOutlet UIImageView *imageAtBottom;
@property(nonatomic,retain) IBOutlet UIImageView *imageAtTop;
@property(nonatomic,retain) IBOutlet UIImageView *imageAtMiddle;
@property(nonatomic, retain) Profile *otherUserProfile;
-(IBAction)imageToFullScreen;
-(IBAction)imageToNormal;
@end
