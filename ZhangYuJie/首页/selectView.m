//
//  selectView.m
//  ZhangYuJie
//
//  Created by Star J on 2018/2/26.
//  Copyright © 2018年 Star J. All rights reserved.
//

#import "selectView.h"

@implementation selectView


-(instancetype)initWithFrame:(CGRect)frame{
    if(self){
        self = [super initWithFrame:frame];
        [self createView];    }
    return self;
}

-(void)createView{
    self.showTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.frame.size.height - 20) style:UITableViewStylePlain];
    self.showTableView.delegate = self;
    self.showTableView.dataSource = self;
    [self addSubview:self.showTableView];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        
    }
    
    cell.textLabel.text =@"哈哈哈";
    
    return cell;
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
