//
//  LockButton.h
//  VpnPassword
//
//  Created by Gabriel Vieira Figueiredo Tomaz on 10/12/18.
//  Copyright © 2018 Gabriel Vieira Figueiredo Tomaz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class LockButton;

@protocol LockButtonDelegate <NSObject>

- (void)LockButtonDidTap:(LockButton *)sender withState:(BOOL)lock;

@end


@interface LockButton : NSButton

@property (nonatomic, weak) id <LockButtonDelegate> delegate;

@end



