//
//  ViewController.m
//  CodeSnippets
//
//  Created by GeekRRK on 1/8/16.
//  Copyright © 2016 GeekRRK. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBarViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBarViewController *ctrl =
    [[UINavigationBarViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
