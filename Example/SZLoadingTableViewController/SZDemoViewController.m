//
//  SZViewController.m
//  SZLoadingTableViewController
//
//  Created by Suric Zhang on 01/31/2016.
//  Copyright (c) 2016 Suric Zhang. All rights reserved.
//

#import "SZDemoViewController.h"

@interface SZDemoViewController ()
@property (strong, nonatomic) NSMutableArray *allCompany;
@end

@implementation SZDemoViewController

#pragma mark - LifeStyle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.allCompany = [[NSMutableArray alloc]init];
    
    //self.canLoadMore = YES;
    [self startLaoding];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopLoading];
        [self addData];
        [self.tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)addData {
    for (int i = 0 ; i < 20; i++) {
        [self.allCompany addObject:[NSString stringWithFormat:@"Apple %d",i]];
    }
}

#pragma nark -LoadMore

- (BOOL)loadMore {
    if (!self.canLoadMore || ![super loadMore]) {
        return NO;
    } else {
        [self performSelector:@selector(loadMoreData) withObject:nil afterDelay:0];
        return YES;
    }
}

- (void)loadMoreData {
    [self addData];
    self.canLoadMore = NO;
    [self loadMoreCompleted];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allCompany.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyCell" forIndexPath:indexPath];
    NSString *companyName = [self.allCompany objectAtIndex:indexPath.row];
    cell.textLabel.text = companyName;
    return cell;
}

@end
