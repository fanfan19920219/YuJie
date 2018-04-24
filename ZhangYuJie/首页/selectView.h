//
//  selectView.h
//  ZhangYuJie
//
//  Created by Star J on 2018/2/26.
//  Copyright © 2018年 Star J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface selectView : UIView<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic , strong)UITableView *showTableView;


-(instancetype)initWithFrame:(CGRect)frame;

@end
