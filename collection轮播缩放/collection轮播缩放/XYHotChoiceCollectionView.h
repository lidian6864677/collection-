//
//  XYHotChoiceCollectionView.h
//  XYQ
//
//  Created by 李典 on 17/6/21.
//  Copyright © 2017年 李典. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectImageBlock)(NSInteger index);

@interface XYHotChoiceCollectionView : UIView
/**
 *  封装collectionView实现轮播图缩放
 *
 *  @param frame      传入轮播图的frame
 *  @param imageArray 图集数组表示
 *  @param block      点击图片的方法用block公开出去
 *
 *  @return self
 */
- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray selectImageBlock:(selectImageBlock) block;
@end
