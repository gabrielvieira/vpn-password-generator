//
//  AppDelegate.m
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "MenuHandler.h"
#import "GeneratorManager.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) MenuHandler *menuHandler;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.window.minSize = NSSizeFromCGSize(CGSizeMake(350, 400));
    self.window.maxSize = NSSizeFromCGSize(CGSizeMake(350, 400));
    self.menuHandler = [[MenuHandler alloc] init];
    [self createStatusBarItem];
    [self navigateToController];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)navigateToController {
    MainViewController *controller = [[MainViewController alloc] init];
    self.window.contentViewController = controller;
}

- (void)createStatusBarItem {

    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    NSStatusBarButton* statusBarButton = self.statusItem.button;
    statusBarButton.image = [NSImage imageNamed:@"ic_password_typing"];
    statusBarButton.highlighted = NO;
    self.statusItem.menu = [self.menuHandler createStatusBarMenu];
}

@end
