//
//  CFViewController.h
//  BMI_Calculator
//
//  Created by Christina Francis on 10/2/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lb_htUnit;
@property (weak, nonatomic) IBOutlet UILabel *lb_wtUnit;
@property (weak, nonatomic) IBOutlet UILabel *lb_result;

@property (weak, nonatomic) IBOutlet UITextField *tf_ht;
@property (weak, nonatomic) IBOutlet UITextField *tf_wt;

@property (weak, nonatomic)  UITextField *activeTF;

@property (weak, nonatomic) IBOutlet UISwitch *s_on;

@property (weak, nonatomic) IBOutlet UIImageView *i_health;

@property unsigned int count;



@end
