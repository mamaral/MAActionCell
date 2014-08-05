//
//  MATableViewSection.m
//  MAFormViewController
//
//  Created by Mike on 7/23/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "MATableViewSection.h"

@implementation MATableViewSection

+ (instancetype)sectionWithTitle:(NSString *)title cells:(NSArray *)cells {
    MATableViewSection *section = [MATableViewSection new];
    section.title = title;
    section.cells = cells;
    section.headerHeight = UITableViewAutomaticDimension;
    return section;
}

+ (instancetype)sectionWithView:(UIView *)view height:(CGFloat)height cells:(NSArray *)cells {
    MATableViewSection *section = [MATableViewSection new];
    section.cells = cells;
    section.headerView = view;
    section.headerHeight = height ?: UITableViewAutomaticDimension;
    return section;
}

@end
