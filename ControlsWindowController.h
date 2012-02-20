//
//  ControlsWindowController.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 1/24/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ControlsWindowController : NSWindowController {
	IBOutlet QCCompositionParameterView* parameterView;
	QCView* qcView;
	IBOutlet NSPanel* ps3Instructions;
	IBOutlet NSPanel* syphonInstructions;
	IBOutlet NSButton* mirrorButton;
	IBOutlet NSButton* freakoutButton;
	IBOutlet NSButton* citylightsButton;
}

-(void) setQcView:(QCView *)view;
-(IBAction) showPS3Instructions:(id)sender;
-(IBAction) showSyphonInstructions:(id)sender;
-(IBAction) downloadSyphonRecorder:(id)sender;
-(IBAction) nextComposition:(id)sender;
-(IBAction) toggleMirror:(id)sender;
-(IBAction) toggleCityLights:(id)sender;
-(IBAction) toggleFreakOut:(id)sender;
-(IBAction) setFeedbackAlpha:(id)sender;
-(IBAction) setFeedbackRotation:(id)sender;
-(IBAction) setFeedbackDirection:(id)sender;
-(IBAction) setInvertAmount:(id)sender;
-(IBAction) setXBlur:(id)sender;
-(IBAction) setYBlur:(id)sender;
-(IBAction) setWobble:(id)sender;
-(IBAction) toggleMode:(id)sender;
-(IBAction) toggleUseController:(id)sender;
-(IBAction) toggleSyphon:(id)sender;

@end
