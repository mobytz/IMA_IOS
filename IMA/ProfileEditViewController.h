//
//  ProfileEditViewController.h
//  IMA
//
//  Created by Mobytz-002 on 11/01/2013.
//
//

#import <UIKit/UIKit.h>

@interface ProfileEditViewController : UIViewController<UIActionSheetDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITextField *genderTextField;
    IBOutlet UITextField *statusTextField;
    UIActionSheet *actionSheetGender;
    UIActionSheet *actionSheetStatus;
    UIActionSheet *actionSheetImagePicker;
    IBOutlet UITextField *ageTextField;
    IBOutlet UITextField *nameTextField;
    IBOutlet UIImageView *profileImageView;
    
    
}
@property (nonatomic)BOOL *isEditable;
@property (nonatomic,retain) IBOutlet UIButton *imageButton;
@property (nonatomic,retain) UIImagePickerController * imagepicker;

-(IBAction)popUpActionSheet;
@property (nonatomic,readonly) IBOutlet UIImageView * profileImageView;
@property (nonatomic,retain) IBOutlet UIImageView *imageAtCorner;
@property (nonatomic,retain) IBOutlet UIImageView *imageAtBottomCorner;
@property (nonatomic,retain) IBOutlet UIImageView *imageAtTop;
@property (nonatomic,retain) IBOutlet UIImageView *imageAtMiddle;
@property(nonatomic,retain) IBOutlet UITextField *genderTextField;
@property(nonatomic,retain) IBOutlet UITextField *statusTextField;
@property(nonatomic,retain) IBOutlet UITextField *ageTextField;
@property(nonatomic,retain) IBOutlet UITextField *nameTextField;
-(IBAction)actionSheetPopupGender;
-(IBAction)actionSheetPopupStatus;
-(void)addDoneButtonToNumberpad;
-(void)getSavedData;
-(void)editableOrNot;


@end
