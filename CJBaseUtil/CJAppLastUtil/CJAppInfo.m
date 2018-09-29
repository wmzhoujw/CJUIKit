//
//  CJAppInfo.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/9/29.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "CJAppInfo.h"

@implementation CJAppInfo

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.lastAppVersion = [aDecoder decodeObjectForKey:@"lastAppVersion"];
        self.lastAppBuild = [aDecoder decodeObjectForKey:@"lastAppBuild"];
        self.lastAppRootViewControllerType = (CJRootViewControllerType)[[aDecoder decodeObjectForKey:@"lastAppRootViewControllerType"] integerValue];
        self.otherUserInfo = [aDecoder decodeObjectForKey:@"otherUserInfo"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.lastAppVersion forKey:@"lastAppVersion"];
    [aCoder encodeObject:self.lastAppBuild forKey:@"lastAppBuild"];
    [aCoder encodeObject:@(self.lastAppRootViewControllerType) forKey:@"lastAppRootViewControllerType"];
    [aCoder encodeObject:self.otherUserInfo forKey:@"otherUserInfo"];
}


///是否是第一次安装app
- (BOOL)isFirstInstallApp {
    NSString *lastAppVersion = self.lastAppVersion;
    if (lastAppVersion == nil) {
        return YES;
    } else {
        return NO;
    }
}

///是否是第一次安装这个版本
- (BOOL)isFirstInstallThisVersion {
    NSString *lastAppVersion = self.lastAppVersion;
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *currentAppVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    BOOL isUpperVersion = [currentAppVersion compare:lastAppVersion options:NSNumericSearch] == NSOrderedDescending;//当前版本高于上次版本
    if (isUpperVersion) {
        return YES;
    } else {
        return NO;
    }
    
    
}
@end
