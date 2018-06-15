//
//  KKBaseTableViewController.h
//  KKFrameProject
//
//  Created by 孔繁武 on 2018/6/14.
//  Copyright © 2018年 孔繁武. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBaseTableViewController : KKBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
- (void)loadData;
@end
