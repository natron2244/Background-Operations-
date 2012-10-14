//
//  NSArray+SortedArrayOnBackground.h
//  SkillBase
//
//  Created by Nathan Christensen on 2012-09-30.
//  Copyright (c) 2012 Nathan Christensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBConstants.h"

@interface NSArray (SortedArrayOnBackground)

// Sorts the array on the background
-(void) sortedArrayOnBackgroundUsingComparator:(NSComparator)comparator
                                    completion:(ArrayCompletionBlock) completion;

@end
