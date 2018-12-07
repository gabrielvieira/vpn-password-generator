//
//  LocalStorage.h
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalStorage : NSObject

+ (void)saveSecret:(NSString *)secret;
+ (void)savePassword:(NSString *)password;

+ (NSString *)getSecret;
+ (NSString *)getPassword;

+ (BOOL)checkValues;

@end
