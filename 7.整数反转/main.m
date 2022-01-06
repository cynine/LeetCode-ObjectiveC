//
//  main.m
//  7.整数反转
//
//  Created by leizhangjie on 2022/1/6.
//

#import <Foundation/Foundation.h>


/*
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
  

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 */

@interface Solution : NSObject

@end

@implementation Solution

+(NSInteger)reverse:(NSInteger)parInt {
    NSInteger result = 0;
    while (parInt != 0) {
        NSInteger temp = parInt % 10;
        parInt /= 10;
        result = result * 10 + temp;
    }
    return result;
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSInteger result = [Solution reverse:-123];
        NSLog(@"%ld", result);
    }
    return 0;
}
