//
//  ControlsWindowController.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class QCPatchController;

@interface ControlsWindowController : NSWindowController {
	IBOutlet QCPatchController* patchController;
	IBOutlet QCView* qcView;
	IBOutlet NSPanel* ps3Instructions;
	IBOutlet NSPanel* syphonInstructions;
}

-(void) setQcView:(QCView *)view;
-(void) setPatchController:(QCPatchController*)controller;
-(IBAction) showPS3Instructions:(id)sender;
-(IBAction) showSyphonInstructions:(id)sender;
-(IBAction) downloadSyphonRecorder:(id)sender;
-(IBAction) nextComposition:(id)sender;
-(IBAction) toggleMode:(id)sender;

@end
