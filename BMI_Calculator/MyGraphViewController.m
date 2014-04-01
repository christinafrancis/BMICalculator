//
//  MyGraphViewController.m
//  BMI_Calculator
//
//  Created by Christina Francis on 10/5/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "MyGraphViewController.h"



@implementation MyGraphViewController

-(void) setCountVal:(unsigned int) cnt{
    
    self.count = cnt;
    NSLog(@"%u is cnt parameter",cnt);
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.lb_cnt.text = [NSString stringWithFormat:@"%u",self.count];
    NSLog(@"%u is count at graph",self.count);
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end