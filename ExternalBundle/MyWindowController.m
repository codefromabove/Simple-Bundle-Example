//
//  MyWindowController.m
//  SimpleBundleTest
//
//  Created by Philip Schneider on 1/22/15.
//  Copyright (c) 2015-2019 Code From Above, LLC. All rights reserved.
//

#import "MyWindowController.h"

@interface MyWindowController ()

@end

@implementation MyWindowController

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (IBAction)okAction:(id)sender
{
    [NSApp stopModalWithCode:NSModalResponseOK];
    [self.window close];
}
@end
