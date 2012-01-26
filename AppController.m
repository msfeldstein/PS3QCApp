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
					[self enterFullScreenMode:[NSScreen mainScreen] withOptions:nil];
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
	controlsController = [[ControlsWindowController alloc] initWithWindowNibName:@"Controls"];
	[controlsController loadWindow];
	[controlsController setQcView:qcView];
	[self launchControls:nil];
}


- (void)windowWillClose:(NSNotification *)notification 
{
	[NSApp terminate:self];
}

- (IBAction) enterFullScreen:(id)sender {
	[qcView enterFullScreenMode: [NSScreen mainScreen]
	              withOptions: nil];
	[qcView becomeFirstResponder];
}


- (IBAction) launchControls:(id)sender {
	[[controlsController window] orderFront:self];
}


@end
