////
////  ProfileViewController.m
////  IMA
////
////  Created by Zachariah Tom on 01/01/2013.
////  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
////
//
//#import "ProfileViewController.h"
//
//@interface ProfileViewController ()
//
//@end
//
//@implementation ProfileViewController
//@synthesize genderTextField;
//@synthesize statusTextField;
//@synthesize  ageTextField;
//@synthesize nameTextField;
//@synthesize imageButton,imagepicker,profileImageView,imageAtCorner,imageAtBottomCorner,imageAtMiddle,imageAtTop;
//
//-(void)popUpActionSheet
//{
//    NSString *actionSheetTitle = @"Select the source of image"; //Action Sheet Title
//    NSString *cameraButton = @"Camera";
//    NSString *albumButton = @"Photo Album";
//    NSString *cancelTitle = @"Cancel ";
//    actionSheetImagePicker = [[UIActionSheet alloc]
//                                  initWithTitle:actionSheetTitle
//                                  delegate:self
//                                  cancelButtonTitle:cancelTitle
//                                  destructiveButtonTitle:nil
//                                  otherButtonTitles:cameraButton, albumButton, nil];
//    
//    
//    [actionSheetImagePicker showInView:[self.view window]]; 
//    [actionSheetImagePicker release];
//}
//
//
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    [picker dismissModalViewControllerAnimated:YES];
//    [profileImageView   setImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"] ];
//    
//}
//
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.title = NSLocalizedString(@"Profile", @"Profile");
//        self.tabBarItem.image = [UIImage imageNamed:@"Profile.png"];
//    }
//    return self;
//}
//
//-(IBAction)actionSheetPopupGender
//{
//   
//    [genderTextField resignFirstResponder];
//    actionSheetGender = [[UIActionSheet alloc]
//                                  initWithTitle:@" Select Gender"
//                                  delegate:self
//                                  cancelButtonTitle:@"Cancel "
//                                  destructiveButtonTitle:nil
//                                otherButtonTitles:@"Male",@"Female ", nil];
//   [actionSheetGender showInView:[self.view window]];
//   [actionSheetGender release];
//}
//-(IBAction)actionSheetPopupStatus
//{
//   //
//    
//    
//    [statusTextField resignFirstResponder];
//    actionSheetStatus = [[UIActionSheet alloc]
//                         initWithTitle:@" Select Status"
//                         delegate:self
//                         cancelButtonTitle:@"Cancel "
//                         destructiveButtonTitle:nil
//                         otherButtonTitles:@"Single",@"In a relationship ", nil];
//    [actionSheetStatus showInView:[self.view window]];
//    [actionSheetStatus release];
//
//}
//-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//
//{
//    if(actionSheet==actionSheetGender)
//    {
//        
//      if (buttonIndex==0)
//      {
//        
//          [genderTextField setText:[NSString stringWithFormat:@"Male"]];
//          imageAtCorner.image=[UIImage imageNamed:@"cornerBlue.png"];
//          imageAtBottomCorner.image=[UIImage imageNamed:@"cornerBlue.png"];
//          imageAtMiddle.image=[UIImage imageNamed:@"Cyan.png"];     imageAtTop.image=[UIImage imageNamed:@"Cyan.png"];
//               
//      }
//      else if (buttonIndex==1)
//      {
//        
//          [genderTextField setText:[NSString stringWithFormat:@"Female"]];
//           imageAtCorner.image=[UIImage imageNamed:@"cornerPink.png"];
//          imageAtBottomCorner.image=[UIImage imageNamed:@"cornerPink.png"];
//          imageAtMiddle.image=[UIImage imageNamed:@"Pinkline.png"];     imageAtTop.image=[UIImage imageNamed:@"Pinkline.png"];
//          
//      }
//    }
//    if(actionSheet==actionSheetStatus)
//    {
//        
//        if (buttonIndex==0)
//        {
//        [statusTextField setText:[NSString stringWithFormat:@"Single"]];
//            
//        }
//        else if (buttonIndex==1)
//        {
//           // [statusButton setTitle:[NSString stringWithFormat:@"In a relationship"] forState:UIControlStateNormal];
//        [statusTextField setText:[NSString stringWithFormat:@"In a relationship"]];
//
//        }
//            }
//    if(actionSheet==actionSheetImagePicker)
//    {
//        imagepicker = [[UIImagePickerController alloc]init];
//        imagepicker.delegate=self;
//        if (buttonIndex==1)
//        {
//            
//            self.imagepicker.sourceType= UIImagePickerControllerSourceTypePhotoLibrary;
//            [self presentModalViewController:imagepicker animated:YES];
//            
//        }
//        else if (buttonIndex==0)
//        {
//            self.imagepicker.sourceType=UIImagePickerControllerSourceTypeCamera;
//            [self presentModalViewController:imagepicker animated:YES];
//        }
//        [imagepicker release];
//
//    }
//
//}
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    if(textField==ageTextField)
//    {
//    [self addDoneButtonToNumberpad];
//    ageTextField.text=nil;
//    }
//}
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//   // Do any additional setup after loading the view from its nib.
//    
//    NSLog(@"hello");
//    [self getSavedData];
//    [super viewDidLoad];
//    
//	// Do any additional setup after loading the view, typically from a nib.
//}
//-(void)addDoneButtonToNumberpad
//{
//    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
//    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
//    numberToolbar.items = [NSArray arrayWithObjects:
//                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
//                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
//                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
//                           nil];
//    [numberToolbar sizeToFit];
//    ageTextField.inputAccessoryView = numberToolbar;
// 
//}
//
//-(void)getSavedData
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *name = [defaults objectForKey:@"name"];
//    int age = [defaults integerForKey:@"age"];
//    NSString *ageString = [NSString stringWithFormat:@"%i",age];
//    NSString *gender=[defaults objectForKey:@"gender"];
//    NSString *relationshipStatus=[defaults objectForKey:@"relationshipStatus"];
//    nameTextField.text=name;
//    ageTextField.text=ageString;
//    //genderButton.titleLabel.text=gender;
//    genderTextField.text=gender;
//    statusTextField.text=relationshipStatus;
//    NSLog(@" loading %@  %@ %@ %@",name,ageString,gender,relationshipStatus);
//    NSData *imageData = [defaults dataForKey:@"image"];
//    UIImage *contactImage = [UIImage imageWithData:imageData];
//    profileImageView.image = contactImage;
//    NSData *cornerImageData=[defaults dataForKey:@"corner image"];
//    UIImage *cornerImage=[UIImage imageWithData:cornerImageData];
//    imageAtCorner.image=cornerImage;
//    NSData *bottomImageData=[defaults dataForKey:@"bottom image"];
//    UIImage *bottomImage=[UIImage imageWithData:bottomImageData];
//    imageAtBottomCorner.image=bottomImage;
//    NSData *topImageData=[defaults dataForKey:@"top image"];
//    UIImage *topImage=[UIImage imageWithData:topImageData];
//    imageAtTop.image=topImage;
//    NSData *middleImageData=[defaults dataForKey:@"middle image"];
//    UIImage *middleImage=[UIImage imageWithData:middleImageData];
//    imageAtMiddle.image=middleImage;
//
//
//
//}
//-(void)cancelNumberPad
//{
//    
//    ageTextField.text = @"";
//    [ageTextField resignFirstResponder];
//     
//}
//
//-(void)doneWithNumberPad
//{
//    [ageTextField resignFirstResponder];
//    
//}
//
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;
//{
//    [ageTextField resignFirstResponder];
//    [nameTextField resignFirstResponder];
//    [genderTextField resignFirstResponder];
//    [statusTextField resignFirstResponder];
//    return YES;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    NSString *name = [nameTextField text];
//    int age = [[ageTextField text] integerValue];
//    //NSString *gender=genderButton.titleLabel.text;
//    NSString *gender=genderTextField.text;
//    NSString *relationshipStatus=statusTextField.text;
//    UIImage *contactImage =profileImageView.image;
//    NSData *imageData = UIImagePNGRepresentation(contactImage);
//    UIImage *cornerImage=imageAtCorner.image;
//    NSData *cornerImageData=UIImagePNGRepresentation(cornerImage);
//    UIImage *bottomImage=imageAtBottomCorner.image;
//    NSData *bottomImageData=UIImagePNGRepresentation(bottomImage);
//    
//    UIImage *topImage=imageAtTop.image;
//    NSData *topImageData=UIImagePNGRepresentation(topImage);
//    UIImage *middleImage=imageAtMiddle.image;
//    NSData *middleImageData=UIImagePNGRepresentation(middleImage);
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:name forKey:@"name"];
//    [defaults setInteger:age forKey:@"age"];
//    NSString *ageString = [NSString stringWithFormat:@"%i",age];
//    [defaults setObject:gender forKey:@"gender"];
//    [defaults setObject:relationshipStatus forKey:@"relationshipStatus"];
//    [defaults setObject:imageData forKey:@"image"];
//    [defaults setObject:cornerImageData forKey:@"corner image"];
//    [defaults setObject:bottomImageData forKey:@"bottom image"];
//    [defaults setObject:topImageData forKey:@"top image"];
//    [defaults setObject:middleImageData forKey:@"middle image"];
//    NSLog(@" saving %@  %@ %@ %@ ",name,ageString,gender,relationshipStatus);
//    [defaults synchronize];
//    NSLog(@"Data saved");
//    [super viewWillDisappear:animated];
//
//}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//@end
