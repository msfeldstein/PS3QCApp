//
//  AppController.h
//  PS3QCApp
//
//  Created by Michael Feldstein on 5/28/11.
//  Copyright __MyCompanyName__ 2011 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface RenderView : QCView
@end

@interface AppController : NSObject 
{
    IBOutlet RenderView* qcView;
}

- (IBAction) changeColorToBlue:(id)sender;
- (IBAction) enterFullScreen:(id)sender;
@end
