//
//  AppController.h
//  PS3QCApp
//
//  Created by Michael Feldstein on 5/28/11.
//  Copyright __MyCompanyName__ 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>
#import "ControlsWindowController.h"

@class QCPatchController;

@interface RenderView : QCView
@end

@interface AppController : NSObject 
{
	IBOutlet QCPatchController* patchController;
    IBOutlet RenderView* qcView;
	IBOutlet NSWindow* window;
	IBOutlet NSWindow* controlsWindow;
    BOOL loaded;
    
    ControlsWindowController* controlsController;
    QCView* logoView;
}

@property (assign) IBOutlet QCView* logoView;
@property (retain) ControlsWindowController* controlsController;
@property (assign) IBOutlet NSPanel* ps3Instructions;

- (IBAction) enterFullScreen:(id)sender;
- (IBAction) launchControls:(id)sender;
- (IBAction)start:(id)sender;
- (IBAction)stop:(id)sender;
- (NSWindow*)window;
-(IBAction) showPS3Instructions:(id)sender;
@end
