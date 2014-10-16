//
//  MATableViewControllerDemo.m
//  MATableViewController
//
//  Created by Mike on 8/1/14.
//  Copyright (c) 2014 Mike Amaral. All rights reserved.
//

#import "DemoViewController.h"
#import "MATableViewSection.h"
#import "MAActionCell.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self generateTableView];
}

- (void)generateTableView {
    // Create the cells with their titles, subtitles, and do whatever you want in each cell's
    // respective action block. You can customize the cells just like you would normally do with
    // any other tableview cell to add imageViews, accessoryViews, etc.
    MAActionCell *firstCell = [MAActionCell actionCellWithTitle:@"Push something" subtitle:@"Push it!!" action:^{
        [self pushSomething];
    }];
    
    MAActionCell *secondCell = [MAActionCell actionCellWithTitle:@"Change something" subtitle:@"Whoa..." action:^{
        [self changeSomething];
    }];
    
    MAActionCell *thirdCell = [MAActionCell actionCellWithTitle:@"Say something" subtitle:@"Hello?" action:^{
        [self saySomething];
    }];
    
    MAActionCell *fourthCell = [MAActionCell actionCellWithTitle:@"Choose something" subtitle:@"Decisions... Decisions..." action:^{
        [self chooseSomething];
    }];
    
    // create the sections either with a title or a view/height
    MATableViewSection *firstSection = [MATableViewSection sectionWithTitle:@"This is the first section!" cells:@[firstCell]];
    MATableViewSection *secondSection = [MATableViewSection sectionWithTitle:@"Second section here!" cells:@[secondCell, thirdCell]];
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kittens.jpg"]];
    MATableViewSection *thirdSection = [MATableViewSection sectionWithView:headerImageView height:80 cells:@[fourthCell]];
    
    // create an array from these sections using a property/instance var so you
    // can access them later in the delegate/data source functions
    _sections = @[firstSection, secondSection, thirdSection];
}


#pragma mark - Actions

- (void)pushSomething {
    UIViewController *newVC = [UIViewController new];
    newVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:newVC animated:YES];
}

- (void)changeSomething {
    self.tableView.backgroundColor = [UIColor redColor];
}

- (void)saySomething {
    [[[UIAlertView alloc] initWithTitle:nil message:@"Hello!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

- (void)chooseSomething {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Rate This App" delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Great App", @"Greatest App", nil];
    [actionSheet showInView:self.view];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MATableViewSection *mySection = _sections[section];
    return mySection.cells.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MATableViewSection *mySection = _sections[section];
    return mySection.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    MATableViewSection *mySection = _sections[section];
    return mySection.headerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    MATableViewSection *mySection = _sections[section];
    return mySection.title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MATableViewSection *mySection = _sections[indexPath.section];
    return mySection.cells[indexPath.row];
}


#pragma  mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MATableViewSection *mySection = _sections[indexPath.section];
    MAActionCell *selectedCell = mySection.cells[indexPath.row];
    selectedCell.actionBlock();
}

@end
