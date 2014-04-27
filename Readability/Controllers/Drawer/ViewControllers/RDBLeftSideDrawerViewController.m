//
//  RDBLeftSideDrawerViewController.m
//  Readability
//
//  Created by Kiet Nguyen on 4/27/14.
//  Copyright (c) 2014 Kiet Nguyen. All rights reserved.
//

#import "RDBLeftSideDrawerViewController.h"

@interface RDBLeftSideDrawerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation RDBLeftSideDrawerViewController

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
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    [self.view addSubview:self.tableView];
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setBackgroundColor:[UIColor redColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view setBackgroundColor:[UIColor redColor]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
        
        [cell setBackgroundColor:[UIColor redColor]];
        [cell.textLabel setTextColor:[UIColor whiteColor]];
    }
    
    switch (indexPath.row) {
        case 0:
            [cell.textLabel setText:@"Recommended"];
            break;
        case 1:
            [cell.textLabel setText:@"Reading List"];
            break;
        case 2:
            [cell.textLabel setText:@"Profile"];
            break;
        default:
            break;
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
