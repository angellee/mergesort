//
//  main.m
//  MergeSort
//
//  Created by Angel Lee on 2015-07-08.
//  Copyright (c) 2015 Angel Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray *merge(NSArray *arr1, NSArray *arr2) {
    NSMutableArray *m_arr = [NSMutableArray array];
    int i = 0;
    int j = 0;
    
    while ((i < arr1.count) && (j < arr2.count)) {
        if ([arr1[i] intValue] < [arr2[j] intValue]) {
            [m_arr addObject:arr1[i++]];
        } else if ([arr1[i] intValue] > [arr2[j] intValue]) {
            [m_arr addObject:arr2[j++]];
        } else {
            [m_arr addObject:arr1[i++]];
            [m_arr addObject:arr2[j++]];
        }
    }
    
    if (i == arr1.count) {
        NSRange range = NSMakeRange(j, arr2.count - j);
        NSArray *remainder = [arr2 subarrayWithRange:range];
        [m_arr addObjectsFromArray:remainder];
    } else if (j == arr2.count) {
        NSRange range = NSMakeRange(i, arr1.count - i);
        NSArray *remainder = [arr1 subarrayWithRange:range];
        [m_arr addObjectsFromArray:remainder];
    }
    
    return m_arr;
}

NSArray *mergeSort(NSArray *unsortedArr)
{
    if (unsortedArr.count < 2) {
        return unsortedArr;
    }
    
    int pivot = (int)unsortedArr.count / 2;
    NSRange firstRange = NSMakeRange(0, pivot);
    NSRange secondRange = NSMakeRange(pivot, unsortedArr.count - pivot);
    NSArray *arr1 = [unsortedArr subarrayWithRange:firstRange];
    NSArray *arr2 = [unsortedArr subarrayWithRange:secondRange];
    
    return merge(mergeSort(arr1), mergeSort(arr2));
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *a = @[@5, @4, @3,@6, @2, @1, @7, @2];
        a = mergeSort(a);
    }
    return 0;
}
