//
//  CFViewController.m
//  BMI_Calculator
//
//  Created by Christina Francis on 10/2/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "CFViewController.h"
#import "MyGraphViewController.h"
#import "UITextField+NextPrevCategory.h"

@interface CFViewController ()
- (IBAction)handle_Calculate:(id)sender;
- (IBAction)handle_Toggle:(id)sender;

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tf_ht.nextTextField = self.tf_wt;
    self.tf_wt.nextTextField = self.tf_ht;
    
    self.tf_ht.prevTextField = self.tf_wt;
    self.tf_wt.prevTextField = self.tf_ht;
    
    //to hide label result
    self.lb_result.text = @"  ";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event
{
    NSLog( @"resigning first respond for inputTextField; Touch event!" );
    if ( ! [self isFirstResponder]) {
        if ([self.tf_ht isFirstResponder]) {
            [self.tf_ht resignFirstResponder];
        }
        if ([self.tf_wt isFirstResponder]) {
            [self.tf_wt resignFirstResponder];
        }
    }
    
}

- (void)nextClicked: (UIBarButtonItem*) sender
{
    UITextField* next = self.activeTF.nextTextField;
    if (next) {
        [next becomeFirstResponder];
    }
}

- (void)previousClicked: (UIBarButtonItem*) sender
{
    UITextField* next = self.activeTF.prevTextField;
    if (next) {
        [next becomeFirstResponder];
    }
}

- (void) doneClicked: (UIBarButtonItem*) sender
{
    NSLog( @"done pressed resigning first respond for inputTextField; Touch event!" );
    [self.activeTF resignFirstResponder];
}



- (BOOL)textFieldShouldBeginEditing: (UITextField *) textField
{
    self.activeTF = textField;
    NSLog(@"Right before");
    
    //[self.lb_status isHidden:YES];
    
    self.lb_result.text = @"  ";
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar sizeToFit];
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Previous"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(previousClicked:)];
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc]
                                   initWithTitle: @"Next"
                                   style: UIBarButtonItemStyleDone
                                   target: self
                                   action:@selector(nextClicked:)];
    
    UIBarButtonItem *flexButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                   target: self
                                   action: nil];
    
    UIBarButtonItem *doneButton =[[UIBarButtonItem alloc]
                                  initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                  target: self
                                  action: @selector(doneClicked:)];
    
    NSArray* itemsArray = @[prevButton, nextButton, flexButton, doneButton];
    
    [toolbar setItems: itemsArray];
    
    [textField setInputAccessoryView: toolbar];
    
    return YES;
}



- (IBAction)handle_Calculate:(id)sender {
    
    NSBundle* myMainBundle = [NSBundle mainBundle];
    NSString* normImagePath;
    UIImage* myNormImage;
    
    NSString* dietImagePath;
    UIImage* myDietImage;
   
        normImagePath = [myMainBundle pathForResource: @"images_norm" ofType: @"jpeg"];
        myNormImage = [UIImage imageWithContentsOfFile:normImagePath];
   
        dietImagePath = [myMainBundle pathForResource: @"start-diet-today" ofType: @"jpg"];
        myDietImage = [UIImage imageWithContentsOfFile:dietImagePath];
    
  
    
    // Cannot have float locations or length in NSRange.
    
    NSRange sevRange = NSMakeRange (0, 16);
    NSRange modRange = NSMakeRange (16, 1);
    NSRange mildRange = NSMakeRange (17, 1);
    NSRange normRange = NSMakeRange (18, 7);
    NSRange overRange = NSMakeRange (25, 5);
    NSRange oc1_Range = NSMakeRange (30, 5);
    NSRange oc2_Range = NSMakeRange (35, 5);
    NSRange oc3_Range = NSMakeRange (40, 60);
    
    NSArray *keysForValue = [[NSArray alloc] init];
    
    NSDictionary *BMI_Range = @{
        @"Severe Thinness" :[NSValue valueWithRange:sevRange] ,
        @"Moderate Thinness" : [NSValue valueWithRange:modRange],
        @"Mild Thinness" : [NSValue valueWithRange:mildRange],
        @"Normal weight" : [NSValue valueWithRange:normRange],
        @"Overweight" : [NSValue valueWithRange:overRange],
        @"Obese Class 1" : [NSValue valueWithRange:oc1_Range],
        @"Obese Class 2" : [NSValue valueWithRange:oc2_Range],
        @"Obese Class 3" : [NSValue valueWithRange:oc3_Range]
        
    };
    
    NSDictionary *BMI_Order = @{
                                @"Severe Thinness" : @1 ,
                                @"Moderate Thinness" : @2,
                                @"Mild Thinness" : @3,
                                @"Normal weight" : @4,
                                @"Overweight" : @5,
                                @"Obese Class 1" : @6,
                                @"Obese Class 2" : @7,
                                @"Obese Class 3" : @8
                                
                                };
    
    float ht = [[NSDecimalNumber decimalNumberWithString:[self.tf_ht text]] floatValue];
    float wt = [[NSDecimalNumber decimalNumberWithString:[self.tf_wt text]] floatValue];
    float BMI ;
    NSString* display ;
    
    if( [self.s_on isOn]){
        BMI = wt/ (ht * ht) * 703;
    }
    else{
        BMI = wt/ (ht * ht) * 10000;
    }
    
    BOOL Success_found = NO;
    
    
    for (NSValue *eachValue in [BMI_Range allValues]){
                
        NSLog(@"inside for loop %u is count",self.count);
        if (NSLocationInRange(BMI,[eachValue rangeValue])) {
            
            keysForValue = [BMI_Range allKeysForObject:eachValue];
            NSLog(@"Object for value %f : %@ ",BMI, eachValue);
            display = [[NSString alloc] initWithFormat:@"BMI: %f , you belong to category : %@",BMI, [keysForValue lastObject]];
            
          
            
            [self.lb_result setText:display];
            if([[keysForValue lastObject ] isEqualToString:@"Normal weight" ]){
                self.i_health.image = myNormImage;
            }
            else{
                 self.i_health.image = myDietImage;
            }
            Success_found = YES;
            
            self.count  = [[BMI_Order objectForKey:[keysForValue lastObject]] intValue];
            break;
        }
        
        
        
    }
    
    // Doesn't end up going through this If stmt.
    if (!Success_found) {
        NSLog(@"BMI not located in any of the ranges; BMI:%f",BMI);
    }
    NSLog(@"%u is count ", self.count);
}

- (IBAction)handle_Toggle:(id)sender {
    
    if( [self.s_on isOn]){
        [self.lb_htUnit setText:@"in"];
        [self.lb_wtUnit setText:@"lbs"];
        [self.tf_ht setText:@""];
        [self.tf_wt setText:@""];
    }
    else{
        [self.lb_htUnit setText:@"cm"];
        [self.lb_wtUnit setText:@"kg"];
        [self.tf_ht setText:@""];
        [self.tf_wt setText:@""];
    }
    
}

// This will get called too before the view appears
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    NSLog(@" inside cfViewcont prerare for segue");
    
    if ([[segue identifier] isEqualToString:@"mainToGraph"] ) {
        
        // Get destination view
        MyGraphViewController *vc = [segue destinationViewController];
        
        
        // Pass the information to your destination view
        
        [vc setCountVal:self.count];
        
       
        NSLog(@"End of prepare for segue..");
    }
}

@end
