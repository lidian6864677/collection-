//
//  XYHotChoiceCollectionView.m
//  XYQ
//
//  Created by 李典 on 17/6/21.
//  Copyright © 2017年 李典. All rights reserved.
//

#import "XYHotChoiceCollectionView.h"
#import "XYHotChoiceCollectionViewCell.h"

static NSInteger const itemMid = 10;
static NSInteger const SectionCount = 50;
static NSString *XYHotChoiceCollectionViewCellID = @"XYHotChoiceCollectionViewCellID";

@interface XYHotChoiceCollectionView()<UICollectionViewDelegate,
                                       UICollectionViewDataSource
                                      >

@property (nonatomic, copy) selectImageBlock block;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger itemWidth;
@property (nonatomic, assign) NSInteger itemHeidth;

@end

@implementation XYHotChoiceCollectionView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray selectImageBlock:(selectImageBlock) block
{
    self = [super initWithFrame:frame];
    if (self) {
        self.block = block;
        self.imageArray = imageArray;
        
//        _itemWidth = frame.size.width - 200;
        _itemWidth = (375 - 20) / 2;
        _itemHeidth = frame.size.height - 20;
        [self addSubview:self.collectionView];
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:SectionCount/2] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    }
    return self;
}

#pragma mark - CollectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imageArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return SectionCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XYHotChoiceCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XYHotChoiceCollectionViewCellID forIndexPath:indexPath];
    cell.imageName = self.imageArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.block(indexPath.row);
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, itemMid, 0, 0);//cell 组的间距
}

- (void) scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat offSetX = targetContentOffset->x; //偏移量
    
    CGFloat itemWidth = _itemWidth;   //itemSizem 的宽
    
    //itemSizem的宽度+行间距 = 页码的宽度
    NSInteger pageWidth = itemWidth + itemMid;
    
    //根据偏移量计算 第几页
    NSInteger pageNum = (offSetX+pageWidth/2)/pageWidth;
    
    // (屏幕宽 - 间距 * 2 - 图片宽度) / 2
    CGFloat offsetMid = (375 - itemMid * 2 - itemWidth)/2;
    
    //  根据显示的第几页,从而改变偏移量
    //  滚动到下一页的开始位置  为实现居中  减去 // (屏幕宽 - 间距 * 2 - 图片宽度) / 2
    targetContentOffset->x = pageNum*(pageWidth) - offsetMid;
    
    NSLog(@"%.1f",targetContentOffset->x);
    
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(_itemWidth, _itemHeidth);
        layout.minimumLineSpacing = itemMid;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(10, 0, 10, 0);
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];   // 水平
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
//        _collectionView.pagingEnabled = YES;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[XYHotChoiceCollectionViewCell class] forCellWithReuseIdentifier:XYHotChoiceCollectionViewCellID];
    }
    return _collectionView;
}


@end
