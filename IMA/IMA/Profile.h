//
//  Profile.h
//  IMA
//
//  Created by Mobytz-002 on 03/01/2013.
//
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject
{
    NSString *name,*gender,*status;
    int age;
}
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *gender;
@property(nonatomic, assign) int age;
@property(nonatomic, copy) NSString *status;
@property(nonatomic,retain)UIImage *imageUser;
+profileWithName:(NSString *)newName gender:(NSString *)newGender age:(int)newAge status:(NSString *)newStatus imageUser:(UIImage *)newImage;
@end
