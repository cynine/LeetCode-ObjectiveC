//
//  main.m
//  2.两数相加
//
//  Created by leizhangjie on 2022/1/6.
//

#import <Foundation/Foundation.h>

/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 */

@interface ListNode : NSObject

@property (nonatomic, assign) int val;
@property (nonatomic, strong) ListNode *next;

@end

@implementation ListNode

+ (instancetype)constructNodeWithData:(int)data {
    ListNode *node = [[ListNode alloc] init];
    node.val = data;
    node.next = nil;
    return node;
}

+ (ListNode *)addTwoNumbersWithList:(ListNode *)l1 l2:(ListNode *)l2 {
    // 新链表
    ListNode *dummyHead = [[ListNode alloc] init];
    // 链表指针
    ListNode *p = dummyHead;
    
    
    // 进位
    int carry = 0;
    while (l1.next != nil && l2.next != nil) {
        int x = l1.val ? l1.val : 0;
        int y = l2.val ? l2.val : 0;
        int n = (x + y) % 10 + carry;
        NSLog(@"%d, %d", x, y);
        carry = (x + y) / 10;
        l1 = l1.next;
        l2 = l2.next;
        ListNode *node = [[ListNode alloc] init];
        node.val = n;
        p.next = node;
        [ListNode printFromHeadWithNode:p printPrefixText:@"dummyHead1"];
    }

    // 最后溢出
    if (carry > 0) {
        ListNode *node = [[ListNode alloc] init];
        node.val = carry;
        p.next = node;
    }

    // 移除头节点
    dummyHead = p.next;
    return dummyHead;
}

//正序遍历链表
+ (NSArray<NSNumber *> *)printFromHeadWithNode:(ListNode *)headNode printPrefixText:(NSString *)text {
    //判空处理
    if (!headNode || !headNode.next) {
        return nil;
    }

    ListNode *pNode = headNode.next;
    NSMutableArray *items = [NSMutableArray array];
    while (pNode != nil) {
        [items addObject:@(pNode.val)];
        pNode = pNode.next;
    }
    NSLog(@"%@：%@", text, [items componentsJoinedByString:@"->"]);
    return items;
}

@end

int main(int argc, const char *argv[])
{
    @autoreleasepool {
        // insert code here...

        // l1 = [2,4,3], l2 = [5,6,4]
        ListNode *l1 = [[ListNode alloc] init];
        ListNode *node1 = [ListNode constructNodeWithData:2];
        ListNode *node2 = [ListNode constructNodeWithData:4];
        ListNode *node3 = [ListNode constructNodeWithData:3];
        l1.next = node1;
        node1.next = node2;
        node2.next = node3;

        // l1 = [2,4,3], l2 = [5,6,4]
        ListNode *l2 = [[ListNode alloc] init];
        ListNode *node21 = [ListNode constructNodeWithData:5];
        ListNode *node22 = [ListNode constructNodeWithData:6];
        ListNode *node23 = [ListNode constructNodeWithData:4];
        l2.next = node21;
        node21.next = node22;
        node22.next = node23;

        ListNode *l3 = [ListNode addTwoNumbersWithList:l1 l2:l2];

        [ListNode printFromHeadWithNode:l3 printPrefixText:@"l3"];
    }
    return 0;
}
