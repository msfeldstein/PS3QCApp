//
//  CompositionGridView.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 9/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CompositionGridView.h"

@implementation CompositionGridView

- (NSCollectionViewItem*)newItemForRepresentedObject:(id)object {
    // Let the parent class create the item
    NSCollectionViewItem *item = [super newItemForRepresentedObject:object];
    // Now we need the view so we can create bindings between it and the object.
    
    
    NSView *view = [item view];
    
    
    [view bind:@"title" toObject:object withKeyPath:@"title" options:nil];
    [view bind:@"image" toObject:object withKeyPath:@"image" options:nil];
    
    
    return item;
}

@end
