//
//  MainViewController.m
//  SantanderVpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 29/11/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "MainViewController.h"
#import "LocalStorage.h"
#import "GeneratorManager.h"
#import "LockButton.h"
#import "ProxyManager.h"

@interface MainViewController ()

@property (weak) IBOutlet NSSecureTextField *secretField;
@property (weak) IBOutlet NSSecureTextField *passwordField;
@property (weak) IBOutlet NSButton *generateButton;
@property (weak) IBOutlet LockButton *secretLockButton;
@property (weak) IBOutlet LockButton *passwordLockButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([LocalStorage checkValues] == NO) {
        [[self generateButton] setEnabled: NO];
    }
    
    self.secretField.focusRingType = NSFocusRingTypeNone;
    self.passwordField.focusRingType = NSFocusRingTypeNone;
    self.secretLockButton.delegate = self;
    self.passwordLockButton.delegate = self;
    
    [self populateFields];
}

- (void)populateFields {
    
    if (![[LocalStorage getSecret] isEqualToString:@""]) {
        self.secretField.stringValue = [LocalStorage getSecret];
    }
    
    if (![[LocalStorage getPassword] isEqualToString:@""]) {
        self.passwordField.stringValue = [LocalStorage getPassword];
    }
    
    [self.secretField setEnabled:NO];
    [self.passwordField setEnabled:NO];
    
}

- (IBAction)generateDidTap:(id)sender {
    
    NSString *vpnPassword = [GeneratorManager generateVpnPassword];
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:vpnPassword forType:NSStringPboardType];
}

- (void)LockButtonDidTap:(LockButton *)sender withState:(BOOL)lock {
    
    if (sender == self.secretLockButton) {
    
        if (lock) {
        
            if (![self.secretField.stringValue isEqualToString:@""]) {
                
                [LocalStorage saveSecret:self.secretField.stringValue];
            }
            
            [self.secretField setEnabled:NO];
            
        } else {
            [self.secretField setEnabled:YES];
        }
    }
    
    if (sender == self.passwordLockButton) {
        
        if (lock) {
            
            if (![self.passwordField.stringValue isEqualToString:@""]) {
                
                [LocalStorage savePassword:self.passwordField.stringValue];
            }
            
            [self.passwordField setEnabled:NO];
            
        } else {
            [self.passwordField setEnabled:YES];
        }
    }
}

- (IBAction)proxySwitch:(id)sender {
    [ProxyManager switchProxy];
}

@end
