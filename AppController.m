//
//  AppController.m
//  PS3QCApp
//
//  Created by Michael Feldstein on 5/28/11.
//  Copyright __MyCompanyName__ 2011 . All rights reserved.
//

#import "AppController.h"

@implementation RenderView

- (void) keyDown:(NSEvent*)event
{
	switch([event keyCode]) {
        case 53: // esc
			[self exitFullScreenModeWithOptions:nil];
            break;
	    case 3:
			if ([event modifierFlags] & NSCommandKeyMask) {
				if ([self isInFullScreenMode]) {
					[self exitFullScreenModeWithOptions:nil];
				} else {
					NSDictionary* options = [NSDictionary
											 dictionaryWithObject:[NSNumber numberWithBool:NO]
											 forKey:NSFullScreenModeAllScreens];
					[self enterFullScreenMode:[NSScreen mainScreen] withOptions:options];
				}
				[self becomeFirstResponder];
                [self start:nil];
			}
        default:
            [super keyDown:event];
    }
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

@end

@implementation AppController

@synthesize controlsController, logoView;

- (void) awakeFromNib
{
    if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"PS3QC" ofType:@"qtz"]]) {
        NSLog(@"Could not load composition");
    }
	[qcView becomeFirstResponder];

    controlsController = [[ControlsWindowController alloc] initWithWindowNibName:@"Controls"];
    controlsController.qcView = qcView;
    controlsController.patchController = patchController;
    
    [self.window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
    [self performSelector:@selector(start:) withObject:self afterDelay:0];
}

- (IBAction)start:(id)sender {
    [qcView start:sender];
    [self.logoView stop:sender];
    [self.logoView setHidden:YES];
}

- (IBAction)stop:(id)sender {
    [qcView stop:sender];
    [self.logoView start:sender];
    [self.logoView setHidden:NO];
}

- (NSWindow*) window {
	return window;
}

- (void)windowWillClose:(NSNotification *)notification 
{
	[NSApp terminate:self];
}

- (IBAction) enterFullScreen:(id)sender {
    if ([qcView isInFullScreenMode]) {
        [qcView exitFullScreenModeWithOptions:nil];
        [qcView start:nil];
    } else {
        NSDictionary* options = [NSDictionary
                                    dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                  forKey:NSFullScreenModeAllScreens];
        [qcView enterFullScreenMode: [NSScreen mainScreen]
                      withOptions: options];
        [qcView becomeFirstResponder];
        [qcView start:nil];
    }
}


- (IBAction) launchControls:(id)sender {
    NSRect controlsRect = [[controlsController window] frame];
    NSPoint controlsOrigin = controlsRect.origin;
    NSRect windowRect = [[self window] frame];
	controlsOrigin.x = windowRect.origin.x + windowRect.size.width + 50;
	[[controlsController window] setFrameOrigin:controlsOrigin];
	[[controlsController window] orderFront:self];
    [controlsController.window setMovableByWindowBackground:YES];
    [controlsController.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"controls"]]];
}

-(IBAction) showPS3Instructions:(id)sender {
	[self.ps3Instructions makeKeyAndOrderFront:sender];
}

@end
