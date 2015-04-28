//
//  FLAlert.h
//
//  Created by Anton Gaenko on 12.09.14.
//  Copyright (c) 2014 Futurelabs. All rights reserved.
//

typedef void(^FLAlertCancelBlock)();
typedef void(^FLAlertDoneBlock)();

@interface FLAlert : UIView

/**
 *  Show your custom alert over specific superview
 *
 *  @param text Message to show
 *  @param view View where alert will be showed in the center
 *  @param doneButtonName Title of right button
 *  @param cancelButtonName Title of left button
 *  @param cancelBlock Block to execute when user cancel current alert (tap anywhere outside done button)
 *  @param doneBlock Block to execute when user tap done button
 */
+ (void)showAlert:(NSString*)text
           inView:(UIView*)view
   doneButtonName:(NSString*)doneButtonName
 cancelButtonName:(NSString*)cancelButtonName
         onCancel:(FLAlertCancelBlock)cancelBlock
           onDone:(FLAlertDoneBlock)doneBlock;

@end
