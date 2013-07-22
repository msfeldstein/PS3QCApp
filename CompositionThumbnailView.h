//
//  CompositionThumbnailView.h
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CompositionThumbnailView : NSView {
    NSImageView* thumbnail;
    NSImage* _image;
}
@property (retain) NSImage* image;
@property (retain) NSString* title;
@end
