//
//  MyGraphView.m
//  BMI_Calculator
//
//  Created by Christina Francis on 10/5/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "MyGraphView.h"


// Drawing code taken from the Apple QuartzDemo
// <http://developer.apple.com/library/ios/#samplecode/QuartzDemo/Introduction/Intro.html>


#define DEG2RAD(degrees) (degrees * 0.01745327) // degrees * pi

@implementation MyGraphView



- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"initWithFrame");
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSLog(@"initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor whiteColor];
		self.opaque = YES;
		self.clearsContextBeforeDrawing = YES;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    self.count = [self.lb_cnt.text intValue] - 1;
    NSLog(@"%@ is cnt inside graph view",self.lb_cnt.text);
    
    /*UIColor *grayColor = [UIColor grayColor];
    
    [grayColor set];
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    
    
    CGContextFillEllipseInRect(context, CGRectMake((10 + self.count* 40) , (300 - self.count*30) - 40, 40, 40));
   // CGContextStrokeEllipseInRect(context, CGRectMake((15 + self.count* 40) , (300 - self.count*30) - 30, 30, 30));
    */
    CGRect frm = CGRectMake((10 + self.count* 40) , (300 - self.count*30) - 40, 40, 40);
    self.i_health.frame = frm;
    // Drawing with a white stroke color
    CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    // And drawing with a blue fill color
    CGContextSetRGBFillColor(context, 0.4, 0.5, 0.3, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 2.0);

    // Add Rect to the current path, then stroke it
    CGContextAddRect(context, CGRectMake( 20.0, 300.0, 20.0,60.0));
    CGContextFillPath(context);
    CGContextStrokePath(context);
    
    //-----------------------------------------------------------------
    
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.4, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(60.0, 270.0, 20.0, 90.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.6, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(100.0, 240.0, 20.0, 120.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.7, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(140.0, 210.0, 20.0, 150.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.8, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(180.0, 180.0, 20.0, 180.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 0.9, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(220.0, 150.0, 20.0, 210.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 1.0, 0.5, 0.3, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(260.0, 120.0, 20.0, 240.0));
    CGContextRestoreGState(context);
    
    //--------------------------------------------------------------------
    CGContextSaveGState(context);
    CGContextSetRGBFillColor(context, 1.0, 0.7, 0.5, 1.0);
    
    
    CGContextFillRect(context, CGRectMake(300.0, 90.0, 20.0, 270.0));
    CGContextRestoreGState(context);
    
 
    
 
    
    
    
}


@end
