MAActionCell
==================

MAActionCell is intended to be used with the MATableViewSection object to hugely simplify and consolidate all of the logic surrounding creating static UITableViews and handling the data source and delegate logic. No more if-statements or switches in every delegate/data source function determining which section has which title/header/height and which row is going to be associated with which cell/action.

While this makes creating a static table view controller much faster and easier without the need for all the repeated logic, it also makes it extremely easy to change the table view layout later to add, remove, or move cells and sections as the data source and delegate functions can remain unchanged - the only thing that needs to be updated is the generation of the cells/sections themselves.


Usage
=====

1. Drop MAActionCell.h/m and MATableViewSection.h/m into your table view file. 
2. Create instances of MAActionCells by defining the titles, subtitles, and action blocks for each. 
3. Package them all up into MATableViewSections defining either the title for the section or the header view and associated height for the section. 
4. Package up each section in an array in the order you want the sections to be displayed.
5. In each delegate/data source function reference your array of sections and section objects directly without having to implement any logic to check the section/row.

Generate the cells and sections ahead of time:


```js
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // generate the table view in view did load
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

```

Then you can simply reference your section array directly to access everything directly in the data source/delegate functions:

```js
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

```

![demo](screenshots/demo.gif)


License
=====

This project is made available under the MIT license. See LICENSE.txt for details.
