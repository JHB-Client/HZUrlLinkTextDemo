//
//  HZLinkTextView.h
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HZLinkTextViewDelegate <NSObject>
- (void)urlStrClick:(NSString *)urlStr;
@end

@interface HZLinkTextView : UIView
- (void)sizeToFitLinkStr;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, copy) NSString *linkString;
@property (nonatomic, weak) id <HZLinkTextViewDelegate>delegate;
@end
