//
//  UFTextAppDelegate.h
//  UFText
//
//  Created by Jamin Guy on 10/28/10.
//  Copyright 2010 Griffin Technology. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class UFTextController;

@interface UFTextAppDelegate : NSObject <NSApplicationDelegate> {   
}

@property (nonatomic, retain) IBOutlet UFTextController *ufTextController;

@end
