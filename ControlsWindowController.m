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
- (void) awakeFromNib {
	[patchController addObserver:self forKeyPath:@"patch.Composition_List.value" options:0 context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSArray* comps = [object valueForKeyPath:keyPath];
	NSLog(@"COMPS : %@" ,comps);
	
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

-(IBAction) toggleMode:(id)sender {
	NSNumber* oldValue = [qcView valueForInputKey:@"ToggleMode"];
	[qcView setValue:[NSNumber numberWithBool:![oldValue boolValue]] forInputKey:@"ToggleMode"];
}
@end
