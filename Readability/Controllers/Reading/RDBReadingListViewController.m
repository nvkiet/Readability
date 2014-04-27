//
//  RDBReadingListViewController.m
//  Readability
//
//  Created by Kiet Nguyen on 4/26/14.
//  Copyright (c) 2014 Kiet Nguyen. All rights reserved.
//

#import "RDBReadingListViewController.h"

@interface RDBReadingListViewController ()

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
