//
//  FLAlert.m
//  Brandle
//
//  Created by Anton Gaenko on 12.09.14.
//  Copyright (c) 2014 Futurelabs. All rights reserved.
//

#import "FLAlert.h"
#import "CAAnimation+Bounce.h"

@interface FLAlert ()

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIView* container;

@property (strong, nonatomic) FLAlertCancelBlock onCancel;
@property (strong, nonatomic) FLAlertDoneBlock onDone;

@end

@implementation FLAlert

+ (void)showAlert:(NSString*)text
           inView:(UIView*)view
   doneButtonName:(NSString*)doneButtonName
 cancelButtonName:(NSString*)cancelButtonName
         onCancel:(FLAlertCancelBlock)cancelBlock
           onDone:(FLAlertDoneBlock)doneBlock {
    FLAlert* alert = [FLAlert new]; 
    
    // load alert from nib
    NSArray* views = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:alert options:nil];
    
    // layout
    UIView* container = views[0];
    container.translatesAutoresizingMaskIntoConstraints = NO;
    alert.frame = view.bounds;
    
    // fill alert
    alert.onCancel = cancelBlock;
    alert.onDone = doneBlock;
    [alert.doneButton setTitle:[doneButtonName uppercaseString] forState:UIControlStateNormal];
    [alert.doneButton addTarget:alert action:@selector(onDone:) forControlEvents:UIControlEventTouchUpInside];
    
    alert.messageLabel.text = text;
    
    [alert.cancelButton setTitle:[cancelButtonName uppercaseString] forState:UIControlStateNormal];
    [alert.cancelButton addTarget:alert action:@selector(onCancel:) forControlEvents:UIControlEventTouchUpInside];
    
    // add tap to dismiss
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:alert action:@selector(onCancel:)];
    [alert addGestureRecognizer:tapRecognizer];
    
    // add overlay
    UIView* overlay = [UIView new];
    overlay.frame = view.bounds;
    overlay.backgroundColor = [UIColor blackColor];
    overlay.alpha = 0.8f;
    [alert addSubview:overlay];
    
    // add container with content
    [alert addSubview:container];
    
    // add to superview
    [view addSubview:alert];
    
    // ! attention: firsly layout
    [alert layoutIfNeeded];
    
    // then move center
    CGPoint center = CGPointMake(CGRectGetMidX(alert.bounds), CGRectGetMidY(alert.bounds));
    container.center = center;
    
    // animate
    [container.layer addAnimation:[CAAnimation bounceInForKeyPath:@"transform.scale" duration:0.5] forKey:@"bounce"];
}

- (void)commonDismissingWithCompletion:(dispatch_block_t)completion {
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [self removeFromSuperview];
        if (completion) completion();
    }];
    self.container.layer.transform = CATransform3DMakeScale(0, 0, 0);
    [self.container.layer addAnimation:[CAAnimation bounceOutForKeyPath:@"transform.scale" duration:0.3f] forKey:@"bounce"];
    [CATransaction commit];
}

- (IBAction)onDone:(id)sender {
    [self commonDismissingWithCompletion:^{
        if (self.onDone) self.onDone();
    }];
}

- (IBAction)onCancel:(id)sender {
    [self commonDismissingWithCompletion:^{
        if (self.onCancel) self.onCancel();
    }];
    
}
@end
