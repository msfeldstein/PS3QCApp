//
//  CompositionThumbnailView.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CompositionThumbnailView.h"

@interface CompositionThumbnailView ()

@end

@implementation CompositionThumbnailView
@synthesize title;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    NSRect frame = [self frame];
    
    thumbnail = [[NSImageView alloc] initWithFrame:frame];
    [self addSubview:thumbnail];
    return self;
}

- (NSImage*)image {
    return _image;
}

- (void)setImage:(NSImage *)image {
    thumbnail.image = image;
    _image = image;
}


@end
