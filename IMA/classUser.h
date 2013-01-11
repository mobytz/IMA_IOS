//
//  classUser.h
//  IMA
//
//  Created by Mobytz on 09/01/2013.
//
//

#import <Foundation/Foundation.h>

@interface classUser : NSObject{
    UIImage *imgProfilePic;
    NSString *userOrigName;
    NSString *userUid;
    NSString *userWork;
    NSString *userFrom;
    NSNumber *userAge;
    NSString *userRelatStatus;
    NSString *userState;
    UIImage *imgTriangle;
    //BOOL isMale;
}

@property(nonatomic,copy) NSString *userOrigName;

@property(nonatomic,retain) NSString *userUid;

@property(nonatomic,copy) NSString *userWork;

@property(nonatomic,copy) NSString *userRelatStatus;

@property(nonatomic,copy) NSString *userState;

@property(nonatomic,retain) UIImage *imgProfilePic;

@property(nonatomic,retain) UIImage *imgTriangle;

@property(nonatomic,retain) NSNumber *userAge;

@property(nonatomic,retain)NSString* userGender;

@property(nonatomic,retain)NSString* userFrom;


+(id)UserwithUid:(NSString*)NewUserid Name:(NSString*)NewName ProfileImage:(UIImage*)NewProfileImage Work:(NSString*)NewWork Age:(NSNumber*)NewAge RelatioStatus:(NSString*)NewRelationStatus Status:(NSString*)NewStatus userGender:(NSString*)NewUserGender userLocation:(NSString*)NewLocation;

@end
