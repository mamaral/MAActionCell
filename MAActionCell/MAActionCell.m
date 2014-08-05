//
//  MAActionCell.m
//  MAToolKit
//
//  Created by Mike on 7/30/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "MAActionCell.h"

@interface MAActionCell ()

@end

@implementation MAActionCell

+ (instancetype)actionCellWithTitle:(NSString *)title subtitle:(NSString *)subtitle action:(dispatch_block_t)action {
    MAActionCell *actionCell = [[MAActionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    actionCell.textLabel.text = title;
    actionCell.detailTextLabel.text = subtitle;
    actionCell.actionBlock = action ?: ^{};
    return actionCell;
}

@end
