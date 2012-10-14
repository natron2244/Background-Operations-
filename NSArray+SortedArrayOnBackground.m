//
//  NSArray+SortedArrayOnBackground.m
//  SkillBase
//
//  Created by Nathan Christensen on 2012-09-30.
//  Copyright (c) 2012 Nathan Christensen. All rights reserved.
//

#import "NSArray+SortedArrayOnBackground.h"

dispatch_queue_t background_sort_queue(void);

static dispatch_queue_t array_sort_background_queue;

dispatch_queue_t background_sort_queue()
{
    
    if (array_sort_background_queue == NULL)
    {
        array_sort_background_queue = dispatch_queue_create("com.skillbase.backgroundsort", 0);
    }
    return array_sort_background_queue;
}

@implementation NSArray (SortedArrayOnBackground)
-(void) sortedArrayOnBackgroundUsingComparator:(NSComparator)comparator
                                    completion:(ArrayCompletionBlock) completion;
{
    dispatch_async(background_sort_queue(), ^{
        
        NSArray *newArray = [self sortedArrayUsingComparator:comparator];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(newArray);
        });
    });
}

@end
