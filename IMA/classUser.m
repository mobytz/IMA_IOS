//
//  classUser.m
//  IMA
//
//  Created by Mobytz on 09/01/2013.
//
//

#import "classUser.h"

@implementation classUser
@synthesize userOrigName,userRelatStatus,userState,userAge,userUid,userWork,imgProfilePic,imgTriangle,userGender,userFrom;

+(id)UserwithUid:(NSString*)NewUserid Name:(NSString*)NewName ProfileImage:(UIImage*)NewProfileImage Work:(NSString*)NewWork Age:(NSNumber*)NewAge RelatioStatus:(NSString*)NewRelationStatus Status:(NSString*)NewStatus userGender:(NSString*)NewUserGender userLocation:(NSString *)NewLocation
{
    classUser *user=[[classUser alloc]init];
    user.userUid=NewUserid;
    user.userOrigName=NewName;
    user.userAge=NewAge;
    user.userRelatStatus=NewRelationStatus;
    user.userState=NewStatus;
    user.userWork=NewWork;
    user.userGender=NewUserGender;
    user.imgProfilePic=NewProfileImage;
    user.userFrom=NewLocation;
    return user;
}

@end
