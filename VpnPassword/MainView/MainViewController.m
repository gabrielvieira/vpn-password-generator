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

@interface MainViewController ()

@property (weak) IBOutlet NSSecureTextField *secretField;
@property (weak) IBOutlet NSSecureTextField *passwordField;
@property (weak) IBOutlet NSButton *saveButton;
@property (weak) IBOutlet NSButton *generateButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([LocalStorage checkValues] == NO) {
        [[self generateButton] setEnabled: NO];
    }
    
    self.secretField.focusRingType = NSFocusRingTypeNone;
    self.passwordField.focusRingType = NSFocusRingTypeNone;
    
    [self populateFields];
}

- (void)populateFields {
    
    if (![[LocalStorage getSecret] isEqualToString:@""]) {
        
        self.secretField.stringValue = [LocalStorage getSecret];
        [self.secretField setEnabled:NO];
    }
    
    if (![[LocalStorage getPassword] isEqualToString:@""]) {
        
        self.passwordField.stringValue = [LocalStorage getPassword];
        [self.passwordField setEnabled:NO];
    }
}

- (IBAction)saveDidTap:(id)sender {
    
    if ([self.secretField.stringValue isEqualToString:@""] || [self.passwordField.stringValue isEqualToString:@""]) {
        
        //show error
        return;
    }
    
    [LocalStorage saveSecret:self.secretField.stringValue];
    [LocalStorage savePassword:self.passwordField.stringValue];
    [[self generateButton] setEnabled: YES];
    
    [self.passwordField setEnabled:NO];
    [self.secretField setEnabled:NO];
    
}
- (IBAction)generateDidTap:(id)sender {
    
    NSString *vpnPassword = [GeneratorManager generateVpnPassword];
    [[NSPasteboard generalPasteboard] clearContents];
    [[NSPasteboard generalPasteboard] setString:vpnPassword forType:NSStringPboardType];
}

- (IBAction)clearDidTap:(id)sender {
    
    [LocalStorage saveSecret:nil];
    [LocalStorage savePassword:nil];
    self.passwordField.stringValue = @"";
    self.secretField.stringValue = @"";
    [self.passwordField setEnabled:YES];
    [self.secretField setEnabled:YES];
}

@end
