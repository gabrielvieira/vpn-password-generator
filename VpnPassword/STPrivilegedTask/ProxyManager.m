//
//  ProxyManager.m
//  VpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 12/12/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "ProxyManager.h"
#import "NSTask+OneLineTasksWithOutput.h"

@implementation ProxyManager

+ (BOOL)getProxyState {
    
    NSError *error = [[NSError alloc] init];
    
    NSString *batatinha = [NSTask stringByLaunchingPath:@"/usr/sbin/networksetup" withArguments:@[@"-getwebproxy", @"Wi-Fi"] error:&error];
    
    if (error == nil) {
        NSArray *stringArr = [batatinha componentsSeparatedByString:@"\n"];
        
        if ([stringArr[0] containsString:@"Yes"]) {
            return YES;
        } else {
            return NO;
        }
    }
    
    return NO;
}

+ (void)switchProxy {
    
    NSMutableArray *proxyArr = [NSMutableArray arrayWithObjects:@"-setwebproxystate ",@"Wi-Fi ", nil];
    
    NSMutableArray *secureProxyArr = [NSMutableArray arrayWithObjects:@"-setsecurewebproxystate",@"Wi-Fi", nil];
    
    if ([self getProxyState]) {
        
        [proxyArr addObject:@"off"];
        [secureProxyArr addObject:@"off"];
        
    } else {
        
        [proxyArr addObject:@"on"];
        [secureProxyArr addObject:@"on"];
    }
    
//    NSError *error = [[NSError alloc] init]
//
//    NSString *proxyResult = [NSTask stringByLaunchingPath:@"/usr/sbin/networksetup" withArguments:@[@"-getwebproxy", @"Wi-Fi"] error:&error];
//
//    NSString *path = @"/usr/sbin/networksetup";
//
//    NSArray *arg = @[@"-setwebproxystate",@"Wi-Fi", @"off"];
//
//    NSTask *proxyTask = [NSTask launchedTaskWithLaunchPath:path arguments:arg];
//    [proxyTask waitUntilExit];
//
    
//    NSTask *task = [NSTask new];
//
//    [task setLaunchPath:@"/bin/sh"];
//
//    [task setArguments:@[@"networksetup", @"-setwebproxystate", @"Wi-fi", @"on"]];
//
//    [task launch];
//
//    NSTask *secureProxyTask = [NSTask launchedTaskWithLaunchPath:path arguments:secureProxyArr];
//    [secureProxyTask waitUntilExit];
    
//    NSTask *task = [[NSTask alloc] init];
//    [task setLaunchPath:@"/bin/sh"];
//    [task setArguments:[NSArray arrayWithObjects:[[NSBundle mainBundle] pathForResource:@"proxy" ofType:@"sh"], nil]];
////    [task setLaunchPath:@"/Users/gabriel.vieira@ibm.com/Desktop"];
////    [task setArguments:[NSArray arrayWithObjects: @"proxy.sh",nil]];
//     [task waitUntilExit];
    
    system("sudo networksetup -setwebproxystate Wi-Fi off");
}

@end
