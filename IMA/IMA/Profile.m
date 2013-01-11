//
//  Profile.m
//  IMA
//
//  Created by Mobytz-002 on 03/01/2013.
//
//

#import "Profile.h"

@implementation Profile
@synthesize name;
@synthesize age;
@synthesize gender;
@synthesize status;
@synthesize imageUser;
+(id)profileWithName:(NSString *)newName gender:(NSString *)newGender age:(int)newAge status:(NSString *)newStatus imageUser:(UIImage *)newImage
{
    Profile *myProfile=[[[Profile alloc]init]autorelease];
    myProfile.name=newName;
    myProfile.age=newAge;
    myProfile.gender=newGender;
    myProfile.status=newStatus;
    myProfile.imageUser=newImage;
    return myProfile;
}
-(void)dealloc
{
	self.name= nil;
    self.gender=nil;
    self.status=nil;
	[super dealloc];
}

@end
