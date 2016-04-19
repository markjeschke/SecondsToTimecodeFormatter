//
//  TimecodeFormatter.h
//
//  Created by Jeschke, Mark on 4/17/16.
//  Copyright © 2016 Jeschke, Mark. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimecodeFormatter : NSObject

- (NSString *)timeFormatted:(int)totalSeconds;

@end
