//
//  MAActionCell.h
//  MAToolKit
//
//  Created by Mike on 7/30/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAActionCell : UITableViewCell

@property (nonatomic, copy) dispatch_block_t actionBlock;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

+ (instancetype)actionCellWithTitle:(NSString *)title subtitle:(NSString *)subtitle action:(dispatch_block_t)action;

@end
