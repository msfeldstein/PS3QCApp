//
//  ControlWindowController.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 12/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QCState.h"

@interface ControlWindowController : NSWindowController {
	QCState* currentState;
}

@property (/*some shit for GC*/) QCState* currentState;

@end
