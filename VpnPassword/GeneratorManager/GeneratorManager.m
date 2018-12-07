//
//  GeneratorManager.m
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "GeneratorManager.h"
#import "AeroGearOTP.h"
#import "LocalStorage.h"

@implementation GeneratorManager

+ (NSString *)generateOTPToken:(NSString *)secret {

    AGTotp *generator = [[AGTotp alloc] initWithSecret:[AGBase32 base32Decode:secret]];
    // generate token
    NSString *totp = [generator generateOTP];

    return totp;
}

+ (NSString *)generateVpnPassword {
    
    NSString *password = [LocalStorage getPassword];
    NSString *secret = [LocalStorage getSecret];
    
    NSString *otp = [self generateOTPToken:secret];
    
    if (otp != nil) {
        NSString * vpnPassword = [NSString stringWithFormat:@"%@%@", password, otp];
        return vpnPassword;
    }
    return @"";
}

@end
