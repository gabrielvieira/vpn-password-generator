//
//  LocalStorage.m
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "LocalStorage.h"

@implementation LocalStorage

+ (void)saveSecret:(NSString *)secret {
    
    [[NSUserDefaults standardUserDefaults] setObject:secret forKey:@"secret"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)savePassword:(NSString *)password {
    
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getSecret {

    NSString *secret = [[NSUserDefaults standardUserDefaults] stringForKey:@"secret"];
    
    if (secret == nil) {
        return @"";
    } else {
        return secret;
    }
}

+ (NSString *)getPassword {

    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    if (password == nil) {
        return @"";
    } else {
        return password;
    }
}


+ (BOOL)checkValues {
    return ([[NSUserDefaults standardUserDefaults] stringForKey:@"secret"] != nil && [[NSUserDefaults standardUserDefaults] stringForKey:@"password"] != nil);
}
@end
