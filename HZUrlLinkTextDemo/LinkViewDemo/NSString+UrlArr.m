//
//  NSString+UrlArr.m
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "NSString+UrlArr.h"

@implementation NSString (UrlArr)
+ (NSArray *)getWebsitesWithString:(NSString *)string {
    if (string == nil) {
        return @[];
    }
    
    
    NSError *error;
    
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    NSMutableArray *result = [NSMutableArray array];
    for (NSTextCheckingResult *match in arrayOfAllMatches)
    {
        NSString *substringForMatch = [string substringWithRange:match.range];
        NSLog(@"%@",substringForMatch);
        [result addObject:substringForMatch];
    }
    return (NSArray *)result;
}
@end
