//
//  ControlsWindowController.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ControlsWindowController.h"
#import "AppController.h"

@implementation ControlsWindowController
-(void) setQcView:(QCView *)view {
	qcView = view;
	[parameterView setCompositionRenderer:view];
}
@end
