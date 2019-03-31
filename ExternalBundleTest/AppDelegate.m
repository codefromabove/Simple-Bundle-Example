//
//  AppDelegate.m
//  ExternalBundleTest
//
//  Created by Philip Schneider on 1/22/15.
//  Copyright (c) 2015-2019 Code From Above, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet     NSWindow           *window;
@property (nonatomic, strong) MyWindowController *testWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

- (IBAction)buttonAction:(id)sender
{
    if (!self.testWindowController) {
        //
        // Gives the path to the .app. Can get the "separate bundle" path
        // relative to this
        //
        NSString *bundlePath = @"./ExternalBundle.bundle";
        NSBundle *bundle     = [NSBundle bundleWithPath:bundlePath];

        Class someClass = [bundle principalClass];
        id    instance  = [[someClass alloc] initWithWindowNibName:@"MyWindowController"];
        if (![instance isKindOfClass:[NSWindowController class]]) {
            NSLog(@"Bad class??");
            return;
        }

        self.testWindowController = (MyWindowController *)instance;
    }

    // Show window
    [self.testWindowController showWindow:self];
    [NSApp runModalForWindow:[self.testWindowController window]];

    // Get the checkbox state
    NSInteger state  = [[self.testWindowController checkBox] state];
    NSLog(@"state : %ld", (long)state);
}

@end
