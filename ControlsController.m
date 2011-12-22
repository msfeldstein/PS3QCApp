//
//  ControlsController.m
//  MacroMeez Visuals
//
//  Created by Michael Feldstein on 12/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ControlsController.h"


@implementation ControlsController

- (void) awakeFromNib
{
	NSString *bundleRoot = [[NSBundle mainBundle] resourcePath];
	directory = [NSString stringWithFormat:@"%@/%@/", bundleRoot, @"Compositions"];
	NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directory error:nil];
	pngURLs = [dirContents filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH '.qtz'"]];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [pngURLs count];
}

- (id)tableView:(NSTableView *)aTableView
	objectValueForTableColumn:(NSTableColumn *)aTableColumn
	row:(NSInteger)rowIndex
{
	return [pngURLs objectAtIndex:rowIndex];
}
- (void)tableView:(NSTableView *)tableView didClickTableColumn:(NSTableColumn *)tableColumn {
	NSLog(@"Table column click %@", tableColumn);
}

@end
