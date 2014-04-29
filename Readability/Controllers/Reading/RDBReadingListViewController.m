//
//  RDBReadingListViewController.m
//  Readability
//
//  Created by Kiet Nguyen on 4/26/14.
//  Copyright (c) 2014 Kiet Nguyen. All rights reserved.
//

#import "RDBReadingListViewController.h"
#import "RDBArticleCell.h"
#import "RDBArticleViewController.h"

@interface RDBReadingListViewController ()<UISearchDisplayDelegate,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@end

@implementation RDBReadingListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Reading List";
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(editButtonPress:)];
    [self.navigationItem setRightBarButtonItem:editButton];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
    
    self.tableView.tableHeaderView = self.tableHeaderView;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RDBArticleCell";
    
    RDBArticleCell *cell = (RDBArticleCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] firstObject];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RDBArticleViewController *articleVC = [[RDBArticleViewController alloc] initWithNibName:NSStringFromClass([RDBArticleViewController class]) bundle:nil];
    [self.navigationController pushViewController:articleVC animated:YES];
}

#pragma mark - UISearchDisplayDelegate

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
    [self.searchBar removeFromSuperview];
    self.searchBar.frame = CGRectMake(0, 0, 320, 44);
    [self.tableHeaderView addSubview:self.searchBar];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.segmentedControl.hidden = YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    self.segmentedControl.hidden = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
}

#pragma mark - Actions

- (void)refreshData
{
    [self.refreshControl endRefreshing];
}

/* Left drawer press */
- (void)leftDrawerButtonPress: (id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/* Edit button press */
- (void)editButtonPress: (id)sender
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
