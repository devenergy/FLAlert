FLAlert
==================================

Almost every application needs to have a customized UI dialog (alert, popup etc) conforming to application style and design. This component alows you to create and show such alerts easily with elegant API, prebuild animations, touch logic and overlay.

![AlertDemo](https://raw.githubusercontent.com/devenergy/FLAlert/master/alert_demo.gif)

How to use
==================================

Add to your Podfile

`pod 'FLAlert', :git => 'https://github.com/devenergy/FLAlert'`

Create *FLAlert.xib* (or copy [This example xib](https://raw.githubusercontent.com/devenergy/FLAlert/master/FLAlert.xib)), layout it respecting application designer.
Then connect outlets from your xib to code. 

You need to connect such outlets.

```
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIView* container;
```

That's all! Well done!
