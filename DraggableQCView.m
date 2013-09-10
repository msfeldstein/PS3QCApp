//
//  DraggableQCView.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/10/13.
//
//

#import "DraggableQCView.h"

@implementation DraggableQCView

- (id) initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if (self) {
        _openGLContext = [self openGLContext];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(_surfaceNeedsUpdate:)
                                                     name:NSViewGlobalFrameDidChangeNotification
                                                   object:self];
    }
    return self;
}
- (void) _surfaceNeedsUpdate:(NSNotification*)notification
{
    [self update];
}

- (void)update
{
    NSLog(@"Update");
    if ([_openGLContext view] == self) {
        [_openGLContext update];
    }
}

@end
