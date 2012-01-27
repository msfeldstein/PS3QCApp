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
}
-(void) setQcView:(QCView *)view;
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
@end
