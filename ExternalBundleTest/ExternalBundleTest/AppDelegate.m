//
//  AppDelegate.m
//  ExternalBundleTest
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
    if (![self testWindowController])
    {
        //
        // Gives the path to the .app. Can get the "separate bundle" path
        // relative to this
        //
        NSString *bundlePath = @"./ExternalBundle.bundle";
        NSBundle *bundle     = [NSBundle bundleWithPath:bundlePath];

        Class someClass = [bundle principalClass];
        id    instance  = [[someClass alloc] initWithWindowNibName:@"MyWindowController"];
        if (![instance isKindOfClass:[NSWindowController class]])
        {
            NSLog(@"Bad class??");
            return;
        }

        _testWindowController = (MyWindowController*)instance;
    }

    // Show window
    [_testWindowController showWindow:self];
    [NSApp runModalForWindow:[_testWindowController window]];

    // Get the checkbox state
    NSInteger state  = [[_testWindowController checkBox] state];
    NSLog(@"state : %ld", (long)state);
}
@end
