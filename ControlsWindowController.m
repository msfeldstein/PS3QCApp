//
//  ControlsWindowController.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "ControlsWindowController.h"
#import "AppController.h"

// Returns just the file name with no extension from a full file path.
@interface FilenameTransformer : NSValueTransformer
@end
@implementation FilenameTransformer
+ (Class)transformedValueClass { return [NSString class]; }
+ (BOOL)allowsReverseTransformation { return NO; }
- (id)transformedValue:(id)item {
    return [[[item lastPathComponent] stringByDeletingPathExtension] stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
}
@end

@implementation ControlsWindowController
-(void) setPatchController:(QCPatchController*)controller {
	patchController = controller;
	[patchController addObserver:self forKeyPath:@"patch.Comp_Name.value" options:0 context:nil];
	FilenameTransformer* filenameTransformer = [[FilenameTransformer alloc]init];
	NSDictionary* bindingOptions = [NSDictionary dictionaryWithObject:filenameTransformer forKey:NSValueTransformerBindingOption];
	[compositionName bind:@"value" toObject:patchController withKeyPath:@"patch.Comp_Name.value" options:bindingOptions];
	[feedbackAlphaSlider bind:@"value" toObject:patchController withKeyPath:@"patch.Feedback_Alpha.value" options:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSString* path = [patchController valueForKeyPath:keyPath];
	NSString* filename = [path lastPathComponent];

}

-(void) setQcView:(QCView *)view {
	qcView = view;
	[parameterView setCompositionRenderer:view];
	[mirrorButton setState:NSOffState];
	[citylightsButton setState:NSOnState];
	[freakoutButton setState:NSOffState];
}

-(IBAction) showPS3Instructions:(id)sender {
	[ps3Instructions makeKeyAndOrderFront:sender];
}
-(IBAction) showSyphonInstructions:(id)sender {
	[syphonInstructions makeKeyAndOrderFront:sender];
}

-(IBAction) downloadSyphonRecorder:(id)sender {
	NSWorkspace* ws = [NSWorkspace sharedWorkspace];
	NSString* myurl = @"http://syphon.v002.info/recorder/";
	NSURL* url = [NSURL URLWithString:myurl];
	[ws openURL:url];
}
-(IBAction) nextComposition:(id)sender {
	NSNumber* oldValue = [qcView valueForInputKey:@"Trigger_Next"];
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

-(IBAction) setFeedbackRotation:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"Feedback_Rotation"];	
}

-(IBAction) setFeedbackDirection:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"Feedback_Direction_InOut"];
}

-(IBAction) setInvertAmount:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"Invert"];
}

-(IBAction) setXBlur:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"XBlur"];
}

-(IBAction) setYBlur:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"YBlur"];
}

-(IBAction) setWobble:(id)sender {
	[qcView setValue:[sender objectValue] forInputKey:@"Wobble"];
}

-(IBAction) toggleMode:(id)sender {
	NSNumber* oldValue = [qcView valueForInputKey:@"ToggleMode"];
	[qcView setValue:[NSNumber numberWithBool:![oldValue boolValue]] forInputKey:@"ToggleMode"];
}

-(IBAction) toggleUseController:(id)sender {
	[qcView setValue:[NSNumber numberWithBool:[sender state]] forInputKey:@"Use_Controller"];
}

-(IBAction) toggleSyphon:(id)sender {
	[qcView setValue:[NSNumber numberWithBool:[sender state]] forInputKey:@"Enable_Syphon"];	
}
@end
