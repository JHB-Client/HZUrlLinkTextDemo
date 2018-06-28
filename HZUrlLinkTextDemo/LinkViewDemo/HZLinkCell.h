//
//  HZLinkCell.h
//  HZPageViewDemo
//
//  Created by 季怀斌 on 2018/6/28.
//  Copyright © 2018年 huazhuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HZLinkCellDelegate <NSObject>
- (void)openTextUrl:(NSURL *)url;
@end

@interface HZLinkCell : UITableViewCell
@property (nonatomic, copy) NSString *linkString;
@property (nonatomic, weak) id<HZLinkCellDelegate> delegate;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
