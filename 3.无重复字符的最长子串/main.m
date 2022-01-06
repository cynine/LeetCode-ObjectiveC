//
//  main.m
//  3.无重复字符的最长子串
//
//  Created by leizhangjie on 2022/1/6.
//

#import <Foundation/Foundation.h>


/*
 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。

  

 示例 1:

 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 */

@interface Solution: NSObject

@end

@implementation Solution

+ (int)lengthOfLongestSubstring:(NSString *)string {
    // 创建窗口元素容器
    NSMutableDictionary *map = [[NSMutableDictionary alloc] init];
    // 左边界
    int left = 0;
    
    // 有边界
    int right = 0;
    for (; right < string.length; right++) {
        NSString *c = [string substringWithRange:NSMakeRange(right, 1)];
        // 如果窗口内存在该元素
        if (map[c]) {
            // 获取最左边元素
            NSString *leftc = [string substringWithRange:NSMakeRange(left, 1)];
            // 容器内删除最左边元素
            [map removeObjectForKey:leftc];
            // 左边界右移
            left++;
        }
        // 右边界右移
        map[c] = @"1";
    }
    return  right - left;

}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int lenght = [Solution lengthOfLongestSubstring:@"abcabcbb"];
        NSLog(@"%d", lenght);
    }
    return 0;
}
