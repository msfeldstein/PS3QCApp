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
@end