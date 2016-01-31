//
//  SZFooterView.m
//  SZLoadingTableViewControllerDemo
//
//  Created by Suric on 16/1/30.
//  Copyright © 2016年 Suric. All rights reserved.
//

#import "SZFooterView.h"

@implementation SZFooterView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UIView *seperatorLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 0.5)];
        seperatorLine.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:seperatorLine];
        
        self.loading = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.loading.center = self.center;
        [self addSubview:self.loading];
    }
    return self;
}

@end
