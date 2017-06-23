//
//  ViewController.m
//  collection轮播缩放
//
//  Created by 李典 on 17/6/21.
//  Copyright © 2017年 李典. All rights reserved.
//

#import "ViewController.h"
#import "XYHotChoiceCollectionView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) XYHotChoiceCollectionView *hotCollection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *imageArray = @[@"logo01",
                            @"logo02",
                            @"logo03",
                            @"logo04"];
    XYHotChoiceCollectionView *hotCollection = [[XYHotChoiceCollectionView alloc]initWithFrame:CGRectMake(0, 0, 375, 130) imageArray:imageArray selectImageBlock:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
    _hotCollection = hotCollection;
    self.view.backgroundColor= [UIColor grayColor];
    [self.view addSubview:hotCollection];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:_tableView];
    
    

    
    
    
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    if (indexPath.row == 1) {
        [cell.contentView addSubview:_hotCollection];
    }else{
        cell.textLabel.text = @"lidainsid ";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
