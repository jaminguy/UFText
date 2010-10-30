//
//  UFTextController.m
//  UFText
//
//  Created by Jamin Guy on 10/28/10.
//  Copyright 2010 Inphoenixity LLC. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in
//	all copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//	THE SOFTWARE.

#import "UFTextController.h"

@interface UFTextController ()

@property (copy) NSAttributedString *formattedString;

@end

@implementation UFTextController

#define kIconWidth 24

//private
@synthesize formattedString;

//public
@synthesize menu;
@synthesize statusItem;
@synthesize reformatMenuItem;

- (void)awakeFromNib {
	NSStatusBar *bar = [NSStatusBar systemStatusBar];
	NSStatusItem *item = [bar statusItemWithLength:kIconWidth];
	[item setHighlightMode: YES];
	[item setMenu: self.menu];
	[item setEnabled: YES];
	[item setImage:[NSImage imageNamed:@"icon20"]];
	self.statusItem = item;
}

- (IBAction)unformatMenuItemClick:(id)sender {	
	NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];	
	NSArray *copiedItems = [pasteboard readObjectsForClasses:[[NSArray alloc] initWithObjects:[NSAttributedString class], nil] options:[NSDictionary dictionary]];	
	if (copiedItems != nil) {
		NSAttributedString *attributedString = [copiedItems objectAtIndex:0];
		self.formattedString = attributedString;
		[pasteboard clearContents];
		[pasteboard writeObjects:[NSArray arrayWithObject:[attributedString string]]];
	}
}

- (IBAction)reformatMenuItemClick:(id)sender {
	if(self.formattedString) {
		NSPasteboard *pasteboard = [NSPasteboard generalPasteboard];
		[pasteboard clearContents];
		[pasteboard writeObjects:[NSArray arrayWithObjects:self.formattedString, nil]];
	}
}

@end
