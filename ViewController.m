//
//  ViewController.m
//  CodeSnippets
//
//  Created by GeekRRK on 1/8/16.
//  Copyright © 2016 GeekRRK. All rights reserved.
//

#import "ViewController.h"
#import "NSURLConnectViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLConnectViewController *ctrl =
    [[NSURLConnectViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}

@end
