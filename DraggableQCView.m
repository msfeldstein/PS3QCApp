//
//  DraggableQCView.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/10/13.
//
//

#import "DraggableQCView.h"

@implementation DraggableQCView

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_surfaceNeedsUpdate:)
                                                 name:NSViewGlobalFrameDidChangeNotification
                                               object:self];
    [self addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"bounds"]) {
        NSLog(@"Bounds changed");
    }
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

- (void)viewDidEndLiveResize {
    
}

@end
