//
//  LockButton.m
//  VpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 10/12/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import "LockButton.h"

@interface LockButton ()

@property BOOL lock;

@end

@implementation LockButton


-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    [self commonInit];
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self commonInit];
    return self;
}

-(void)commonInit {
    [self setTarget:self];
    [self setAction:@selector(didTap:)];
    [self setImageScaling:NSImageScaleProportionallyDown];
    self.lock = YES;
    [self setStateImage];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(void)didTap:(id)sender {
    
    self.lock = !self.lock;
    [self setStateImage];
    [self.delegate LockButtonDidTap:self withState:self.lock];
    
}

-(void)setStateImage {
 
    if ([self lock]) {
        [self setImage:[NSImage imageNamed:@"ic_lock_close"]];
    } else {
        [self setImage:[NSImage imageNamed:@"ic_lock_open"]];
    }
}

@end
