//
//  HZLinkTextView.m
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZLinkTextView.h"
#import "NSString+UrlArr.h"
#import "Masonry.h"
NS_ASSUME_NONNULL_BEGIN
@interface HZLinkTextView () <UITextViewDelegate>
@property (nonatomic, weak) UITextView *linkTextView;
@property (nonatomic, copy) NSArray *urlStringArr;
@end
NS_ASSUME_NONNULL_END
@implementation HZLinkTextView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:CGRectZero]) {
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    UITextView *linkTextView = [UITextView new];
    linkTextView.delegate = self;
    linkTextView.editable = NO;
    linkTextView.scrollEnabled = NO;
    linkTextView.selectable = true;
    [self addSubview:linkTextView];
    self.linkTextView = linkTextView;
    //
    [self.linkTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self).inset(5);
    }];
}

- (void)setUpLinkText {
    self.urlStringArr = [NSString getWebsitesWithString:self.linkString];
    if (self.urlStringArr.count == 0) {
        self.linkTextView.text = self.linkString;
        return;
    }
    
    //    int font = 32;
    //    UIImage *image = [UIImage imageNamed:select == YES ? @"1.png" : @"2.png"];
    //    CGSize size = CGSizeMake(font + 2, font + 2);
    //    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    //    [image drawInRect:CGRectMake(0, 2, size.width, size.height)];
    //    UIImage *resizeImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //
    //
    //    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    //    textAttachment.image = resizeImage;
    //    NSMutableAttributedString *imageString = [NSMutableAttributedString attributedStringWithAttachment:textAttachment];
    //    [imageString addAttribute:NSLinkAttributeName
    //                        value:@"checkbox://"
    //                        range:NSMakeRange(0, imageString.length)];
    //
    //
    //    //
    //    [attributedString insertAttributedString:imageString atIndex:0];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.linkString];
    for (NSString *linkString in self.urlStringArr) {
        [attributedString addAttribute:NSLinkAttributeName value:linkString range:[[attributedString string] rangeOfString:linkString]];
    }
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, attributedString.length)];
    self.linkTextView.attributedText = attributedString;
    self.linkTextView.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor],
                                     NSUnderlineColorAttributeName: [UIColor greenColor],
                                     NSUnderlineStyleAttributeName: @(NSUnderlinePatternDashDotDot)};
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {

    NSString *urlString = [NSString stringWithFormat:@"%@", URL];
    for (NSString *linkString in self.urlStringArr) {
        if ([urlString isEqualToString:linkString]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(urlStrClick:)]) {
                [self.delegate urlStrClick:urlString];
            }

            return false;
        }
    }
    return true;
}

#pragma mark ----------------- sizeToFitLinkStr ------------------
- (void)sizeToFitLinkStr {
    [self.linkTextView sizeToFit];
}

- (void)setTextFont:(UIFont *)textFont {
    self.linkTextView.font = textFont;
}

- (void)setLinkString:(NSString *)linkString {
    _linkString = linkString;
    //
    [self setUpLinkText];
}
@end
