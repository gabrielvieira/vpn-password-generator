//
//  ProxyManager.h
//  VpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 12/12/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProxyManager : NSObject

+ (BOOL)getProxyState;
+ (void)switchProxy;

@end
