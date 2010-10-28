//
//  UFTextController.m
//  UFText
//
//  Created by Jamin Guy on 10/28/10.
//  Copyright 2010 Griffin Technology. All rights reserved.
//

#import "UFTextController.h"


@implementation UFTextController

@synthesize menu;
@synthesize statusItem;

- (void)awakeFromNib {
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	NSStatusItem *item = [bar statusItemWithLength:16];
	[item setHighlightMode: YES];
	[item setMenu: self.menu];
	[item setEnabled: YES];
	[item setImage:[NSImage imageNamed:@"icon"]];
	self.statusItem = item;
	NSMenuItem *menuItem = [self.menu itemAtIndex:0];
	[menuItem setTarget:self];
	[menuItem setAction:@selector(cleanTextAction:)];
}

- (IBAction)cleanTextAction:(id)sender {
	NSLog(@"YAY");
}

@end
