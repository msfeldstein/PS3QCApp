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


// An example of programmatically setting the value of input ports
// Notice that the QCPatchParameterView is automatically updated by setting the QCView inputs
- (IBAction) changeColorToBlue:(id)sender
{
	// Colors
//	[qcView setValue:[NSColor blueColor] forInputKey:@"Top_Color"];
//	[qcView setValue:[NSColor cyanColor] forInputKey:@"Middle_Color"];
//	[qcView setValue:[NSColor blueColor] forInputKey:@"Bottom_Color"];
//	
//	// Numbers
//	[qcView setValue:[NSNumber numberWithDouble:.5] forInputKey:@"Font_Size"];
//
//	// Strings
//	[qcView setValue:@"Hello World" forInputKey:@"String"];

}


@end
