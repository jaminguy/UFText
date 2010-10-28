//
//  UFTextController.h
//  UFText
//
//  Created by Jamin Guy on 10/28/10.
//  Copyright 2010 Griffin Technology. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface UFTextController : NSObject {

}

@property (nonatomic, retain) IBOutlet NSMenu *menu;
@property (nonatomic, retain) NSStatusItem *statusItem;

- (IBAction)cleanTextAction:(id)sender;


@end
