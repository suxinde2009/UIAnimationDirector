//
//  TestEntriesViewController.m
//  UIAnimationDirector
//
//  Created by shenmo on 14-4-16.
//  Copyright (c) 2014年 王 乾元. All rights reserved.
//

#import "TestEntriesViewController.h"
#import "AppDelegate.h"

@interface TestEntriesViewController ()
{
    UITableView* _tableView;
}

@end

@implementation TestEntriesViewController

- (void)loadView
{
    [super loadView];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Test%d", indexPath.row + 1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id viewController = [[NSClassFromString([NSString stringWithFormat:@"TabViewController%d", indexPath.row + 1]) alloc] init];
    [self presentModalViewController:viewController animated:YES];
    
    UIWindow* window = ((AppDelegate*)([UIApplication sharedApplication].delegate)).window;
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, window.frame.size.height - 18, 27, 18);
    [btn addTarget:self action:@selector(onBack:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn];
}

- (void)onBack:(UIButton*)sender
{
    [sender removeFromSuperview];
    [self dismissModalViewControllerAnimated:YES];
}

@end