//
//  MyGraphView.h
//  BMI_Calculator
//
//  Created by Christina Francis on 10/5/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MyGraphView : UIView

@property unsigned int count;
@property (weak, nonatomic) IBOutlet UILabel *lb_cnt;

@property (weak, nonatomic) IBOutlet UIImageView *i_health;
@end
