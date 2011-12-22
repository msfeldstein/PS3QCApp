//
//  ControlsController.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ControlsController : NSObject {
	NSArray* pngURLs;
	NSString* directory;
	IBOutlet NSTableView* tableView;
}

@end
