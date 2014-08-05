//
//  MATableViewSection.h
//  MAFormViewController
//
//  Created by Mike on 7/23/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MATableViewSection : NSObject

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSArray *cells;
@property (nonatomic, retain) UIView *headerView;
@property (nonatomic) CGFloat headerHeight;

+ (instancetype)sectionWithTitle:(NSString *)title cells:(NSArray *)cells;
+ (instancetype)sectionWithView:(UIView *)view height:(CGFloat)height cells:(NSArray *)cells;

@end
