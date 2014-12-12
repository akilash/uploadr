Uploadr - Intelligent backup service to AWS
==========================================

Although abstract at this point, the core functionality of Uploadr will be to backup your entire cameral roll to an AWS S3 bucket.  The upload process is stateful and will gracefully re-instate itself from where it last left off if you send the app to the background, receive a call or any other interruption.


Open Source Libraries Used:
---------------------------

 * AFNetworking
 * AWSiOSSDKv2
 * MBProgressHUD
 * Reachability
 * ReactiveCocoa
 * SDWebImage


Useful Links:
--------------------------

 * [Photos Framework Reference](https://developer.apple.com/library/ios/documentation/Photos/Reference/Photos_Framework/index.html#//apple_ref/doc/uid/TP40014408)
 * [AWS iOS SDK GitHub] (https://github.com/aws/aws-sdk-ios)


Important Note:
---------------

 * Please open the 'Uploadr.xcworkspace' file to run the project, as this is required for Xcode projects using the Cocoapods Dependency Management Library.


Get Started
-----------

Run the following command to Install Cocoapods.  You may also defer to the [CocoaPods documentation](http://guides.cocoapods.org/using/getting-started.html) for further details.
```
sudo gem install cocoapods
```

Run `pod install` once CocoaPods is installed
Open the Uploadr.xcworkspace start start coding!
