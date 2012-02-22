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
					NSLog(@"Options %@", options);
					[self enterFullScreenMode:[NSScreen mainScreen] withOptions:options];
				}
				[self becomeFirstResponder];
			}
        default:
            [super keyDown:event];
    }
}

@end

@implementation AppController
 
- (void) awakeFromNib
{
	if(![qcView loadCompositionFromFile:[[NSBundle mainBundle] pathForResource:@"PS3QC" ofType:@"qtz"]]) {
		NSLog(@"Could not load composition");
	}
	[qcView becomeFirstResponder];
	NSRect windowRect = [[self window] frame];
	NSRect controlsRect = [[controlsController window] frame];
	NSPoint controlsOrigin = controlsRect.origin;
	controlsOrigin.x = windowRect.origin.x + windowRect.size.width + 50;
	[[controlsController window] setFrameOrigin:controlsOrigin];
	[self launchControls:nil];
}

- (NSWindow*) window {
	return window;
}

- (void)windowWillClose:(NSNotification *)notification 
{
	[NSApp terminate:self];
}

- (IBAction) enterFullScreen:(id)sender {
	NSDictionary* options = [NSDictionary
								dictionaryWithObject:[NSNumber numberWithBool:NO]
											  forKey:NSFullScreenModeAllScreens];
	[qcView enterFullScreenMode: [NSScreen mainScreen]
	              withOptions: options];
	[qcView becomeFirstResponder];
}


- (IBAction) launchControls:(id)sender {
	[[controlsController window] orderFront:self];
}

@end
