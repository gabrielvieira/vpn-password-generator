//
//  MenuHandler.m
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "MenuHandler.h"
#import "GeneratorManager.h"

@implementation MenuHandler

- (NSMenu *)createStatusBarMenu {
    
    NSMenu *menu = [[NSMenu alloc] init];
    
    NSMenuItem *generate =
    [[NSMenuItem alloc] initWithTitle:@"Generate" action:@selector(generateVpnPassword:) keyEquivalent:@""];
    [generate setTarget:self];
    [menu addItem:generate];
    
    return menu;
}

- (void)generateVpnPassword:(id)sender {

    NSString *vpnPassword = [GeneratorManager generateVpnPassword];
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:vpnPassword forType:NSStringPboardType];
}

@end
