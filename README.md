# Convert Objective-C seconds into Timecode format

**Run the Demo**

* Download the `TimecodeFormatter.zip` and unzip its contents.

* Double click on `TimecodeFormatter.xcodeproj` to launch the project.

* Press the `play` icon button or Command-R to run the app within the simulator or your iOS device.

* Tap the `Start` button to begin the NSTimer that will display the incremented seconds in timecode as hours, minutes, and seconds.

**Implementation:**

* Drag/copy or import the `TimecodeFormatter.h` and `TimecodeFormatter.m` files into your Xcode project file.

* Import the `TimecodeFormatter.h` class at the top of your `ViewController.m` file.

```objc
#import "TimecodeFormatter.h"
```

* Add a TimecodeFormatter object, so that the formatter functionality can be referenced from anywhere within the ViewController methods:

```objc
@property (nonatomic, strong) TimecodeFormatter *timecodeFormatter;
```

* Initialize the TimecodeFormatter object in the `- (void) viewDidLoad` method.

```objc
_timecodeFormatter = [[TimecodeFormatter alloc] init];
```

* Call the timecodeFormatter class to format seconds into timecode:

```objc
int currentSeconds = 5;
[_timecodeFormatter timeFormatted:currentSeconds]; 
// Result displays as hours, minutes and seconds: 00:00:05
```

You can change the formatting in the returned NSString value in line #10 of the `TimecodeFormatter.m` file:

```objc
return [NSString stringWithFormat:@"%02dh : %02dm : %02ds", hours, minutes, seconds]; 
// Result displays as 00h : 00m : 05s
```
**Code Credit**

<p>I found this timecode conversion code example on <a href="http://stackoverflow.com/questions/1739383/convert-seconds-integer-to-hhmm-iphone" target="_blank">StackOverflow</a> by <a href="http://stackoverflow.com/users/108955/rohit-agarwal" target="_blank">Rohit Agarwal</a>, and made it into a reusable class for implementing into multiple Xcode projects.</p>
