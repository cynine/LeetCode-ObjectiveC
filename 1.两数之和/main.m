//
//  main.m
//  1.两数之和
//
//  Created by leizhangjie on 2022/1/6.
//

/*
 题目:
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。



 示例 1：

 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 示例 2：

 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 示例 3：

 输入：nums = [3,3], target = 6
 输出：[0,1]

 */

#import <Foundation/Foundation.h>

@interface Solution : NSObject

@end

@implementation Solution

+ (NSArray *)nums:(NSArray *)nums target:(NSInteger)target {
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];

    for (int i = 0; i < [nums count]; i++) {
        [tempDict setValue:@(i) forKey:[NSString stringWithFormat:@"%ld", [nums[i] integerValue]]];
    }

    __block BOOL isHaveValueNumber = NO;

    __block NSArray *result = nil;

    [nums enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        NSString *keyStr = [NSString stringWithFormat:@"%ld", target - [(NSNumber *)obj integerValue]];

        NSNumber *lastIndex = tempDict[keyStr];

        if (lastIndex && idx < [lastIndex integerValue]) {
            NSLog(@"两个数组的index为: %ld, %ld", [lastIndex integerValue], idx);

            isHaveValueNumber = YES;

            result = @[lastIndex, @(idx)];
        }
    }];

    if (!isHaveValueNumber) {
        NSLog(@"No valid outputs");
    }

    return result;
}

@end

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        // insert code here...

        NSArray *nums = @[@2, @7, @11, @15];
        NSInteger target = 9;

        NSArray *result = [Solution nums:nums target:target];
        NSLog(@"result : %@", result);
    }
    return 0;
}
