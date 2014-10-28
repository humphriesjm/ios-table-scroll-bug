//
//  ViewController.m
//  JHALConstraints
//
//  Created by Jason Humphries on 10/28/14.
//  Copyright (c) 2014 Jason Humphries. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *topView;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableTopConstraint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - SCROLL VIEW

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    NSLog(@"scrollView offset: %@", NSStringFromCGPoint(offset));
    
    if (scrollView == self.table) {
        CGPoint offset = scrollView.contentOffset;
        if (offset.y > 0) {
            self.tableTopConstraint.constant = MAX(0.f, 280.f - offset.y);
            [self.table setNeedsUpdateConstraints];
        } else {
            self.tableTopConstraint.constant = 280.f;
            [self.table setNeedsUpdateConstraints];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"HELLO";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
