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

-(IBAction) nextComposition:(id)sender {
	NSNumber* oldValue = [qcView valueForInputKey:@"Trigger_Next"];
	NSLog(@"Old Value %@", oldValue);
	[qcView setValue:[NSNumber numberWithBool:![oldValue boolValue]] forInputKey:@"Trigger_Next"];
}

-(IBAction) toggleMirror:(id)sender {
	[qcView setValue:[NSNumber numberWithBool:[sender state]] forInputKey:@"Mirror"];
}

-(IBAction) toggleCityLights:(id)sender {
	[qcView setValue:[NSNumber numberWithBool:[sender state]] forInputKey:@"City_Lights"];	
}

-(IBAction) toggleFreakOut:(id)sender {
	[qcView setValue:[NSNumber numberWithBool:[sender state]] forInputKey:@"FreakOut"];
}
@end
