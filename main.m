//
//  main.m
//  PS3QCApp
//
//  Created by Michael Feldstein on 5/28/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NSString* getPluginDir() {
	NSString *dir;
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
	if ([paths count] > 0)  {
		dir = [paths objectAtIndex:0];
	}
	dir = [dir stringByAppendingPathComponent:@"Graphics"];
	dir = [dir stringByAppendingPathComponent:@"Quartz Composer Plug-Ins"];
	return dir;
}

void loadPlugins() {
	NSFileManager* defaultManager = [NSFileManager defaultManager];
	NSBundle *main = [NSBundle mainBundle];
	NSArray *all = [main pathsForResourcesOfType:@"plugin" 
									 inDirectory:@"../PlugIns"];
	NSBundle *pluginBundle = nil;
	NSString* libraryPluginPath = getPluginDir();
	NSError* err;
	if (![defaultManager isReadableFileAtPath:libraryPluginPath])
		[defaultManager createDirectoryAtPath:libraryPluginPath withIntermediateDirectories:YES attributes:nil error:&err];
	
	for (NSString *path in all) {
		NSString* pluginName = [libraryPluginPath stringByAppendingPathComponent:[path lastPathComponent]];
		[defaultManager copyItemAtPath:path toPath:pluginName error:&err];
		pluginBundle = [NSBundle bundleWithPath:path];
		[pluginBundle load];
		pluginBundle = nil;
	}
}

int main(int argc, char *argv[])
{
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	loadPlugins();
	// load plugins in our bundle's resource folder
	//[QCPatch loadPlugInsInFolder: [[NSBundle mainBundle] resourcePath]];
	
	int ret = NSApplicationMain(argc,  (const char **) argv);
	[p release];   // probably won't get here, but good practice
    return ret;
}
