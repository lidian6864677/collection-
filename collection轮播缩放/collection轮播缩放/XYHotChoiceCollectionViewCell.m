//
//  XYHotChoiceCollectionViewCell.m
//  XYQ
//
//  Created by 李典 on 17/6/21.
//  Copyright © 2017年 李典. All rights reserved.
//

#import "XYHotChoiceCollectionViewCell.h"

@interface XYHotChoiceCollectionViewCell()
@property (nonatomic, strong) UIImageView *imageView;
@end


@implementation XYHotChoiceCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        [self addSubview:self.imageView];
        
        self.imageView.frame = self.bounds;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.imageView.image = [UIImage imageNamed:imageName];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
@end
