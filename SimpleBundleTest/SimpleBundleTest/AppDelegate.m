//
//  AppDelegate.m
//  SimpleBundleTest
//
//  Created by Philip Schneider on 1/22/15.
//  Copyright (c) 2015 Code From Above, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic, strong) MyWindowController *testWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)buttonAction:(id)sender {
    // Create the modal controller & its window
    if (!_testWindowController)
        _testWindowController = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];

    // Show window
    [_testWindowController showWindow:self];
    [NSApp runModalForWindow:[_testWindowController window]];

    // Get the checkbox state
    NSInteger state  = [[_testWindowController checkBox] state];
    NSLog(@"state : %ld", (long)state);
}
@end
