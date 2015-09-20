//
//  ViewController.m
//  PMRunTimeObject
//
//  Created by PeiZiming on 15/9/20.
//  Copyright (c) 2015年 PZM. All rights reserved.
//

#import "ViewController.h"
#import "PMUIView.h"
#import "PMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PMPerson *person = [[PMPerson alloc] init];
    person.sex = @"male";
    person.name = @"David";
    person.birthday = @"09-20-2015";
    
    NSLog(@"sex - %@", person.sex);
    
//    // This is a bad example，just for show @dynamic
//    PMUIView *view = [[PMUIView alloc] init];
//    view.view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    view.view.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:view.view];
//    view.view = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
