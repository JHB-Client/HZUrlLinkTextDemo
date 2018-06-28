//
//  HZLinkCell.m
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import "HZLinkCell.h"
#import "HZLinkTextView.h"
#import "Masonry.h"
NS_ASSUME_NONNULL_BEGIN
@interface HZLinkCell () <HZLinkTextViewDelegate>
@property (nonatomic, weak) HZLinkTextView *linkTextView;
@end
NS_ASSUME_NONNULL_END
@implementation HZLinkCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    
    return self;
}

- (void)setUpSubViews {
    HZLinkTextView *linkTextView = [HZLinkTextView new];
    linkTextView.delegate = self;
    [self.contentView addSubview:linkTextView];
    self.linkTextView = linkTextView;
    
    [self.linkTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).inset(10);
        make.height.mas_greaterThanOrEqualTo(30);
    }];
    
}

- (void)setLinkString:(NSString *)linkString {
    self.linkTextView.linkString = linkString;
    //
    [self.linkTextView sizeToFitLinkStr];
}


+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *cellID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    return cell;
}

#pragma mark ----------------- HZLinkTextViewDelegate ------------------
- (void)urlStrClick:(NSString *)urlStr {
//    NSLog(@"----urlStr-----%@", urlStr);
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@", urlStr]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(openTextUrl:)]) {
        [self.delegate openTextUrl:url];
    }

}
@end
