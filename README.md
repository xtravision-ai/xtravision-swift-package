# xtravision-swift-package

# Using Swift Package Manager

This Swift Package manager is created for checking assessments.

Add this package dependency in your Xcode project by following steps.
Create New Xcode project. File -> New -> Project -> App -> (Name of your project) ... complete remaining steps
File -> Swift Packages -> Add Package Dependency -> Enter:

 [xtravision-package-url](https://github.com/xtravision-ai/xtravision-swift-package.git)

repository url -> Next -> Select Branch(main) and complete the remaining steps and your package dependency will be added in your xcode project.
Clean and build your project.

# Manual Installation

Open Xcode peoject.
Download framework from :
 [xtravision-framework-url](https://github.com/xtravision-ai/xtravision-swift-framework/releases/download/v1.0.8/XtraVisionAI.xcframework.zip)
 
Now in your xcode project select your TARGET -> General Tab -> Drag and Drop the downloaded folder in Frameworks, Libraries and Embedded Content.
Now build your project.

# How to use this downloaded Library?

Now follow the steps in your controlller to get the assessment results from camera frames 
```
import XtraVisionAI

//Access assessment class and add delegate. Also inherit this delegate XtraVisionAIDelegate
let assessment = XtraVisionAIManager.shared
assessment.delegate = self

```

Camera session will be started after connecting to the XTRAVision's backend

```
//  Prepare Initial Object
let assessmentConfig = XtraVisionAssessmentConfig(repsThreshold, grace_time_threshold: grace_time_threshold, sets_threshold : sets_threshold)
let connectionData = XtraVisionConnectionData(authToken, assessmentName: assessmentName, assessmentConfig: assessmentConfig, session_id : session_id)
var requestData = XtraVisionRequestData(isPreJoin)

//  Change skeleton Line's color and width. Change dot's radius and color using below command
let skeletonConfig = XtraVisionSkeletonConfig(line width, dotRadius: dotradius, lineColor: UIColor.red, dotColor: UIColor.blue)

// Cameraview is one in which you want to show a preview of camera
let libData = XtraVisionLibData(isSkeletonEnable, cameraView: cameraView, skeletonConfig: skeletonConfig)

// create an object and initiate the Assessment process
xtraVisionMgr.configureData(connectionData, requestData: requestData, libData: libData)

```

To disconnect from socket after stop camera session. 
If isPreJoin = true then,

```
xtraVisionMgr.disconnectSession(false)

```

If isPreJoin = false then,

```
xtraVisionMgr.disconnectSession(true)

```

These are the delegate methods of Xtravision SDK.

```
func onMessageReceived(_ message: String) {
    print("message: \(message)")
    //handle the response after start doing the pose
}

func onConnectSuccess() {
    print("Connection done successfully")
}
    
func onConnectFailed(_ string: String) {
    print("Connection failed: ", string)
}
    
func onConnectClose() {
    print("Connection closed")
}
```

# XTRA UI Components

# Repetitions Counter

This is the UI Component that can be used to count reps. 

 defaultRepsColor : Set Color for default reps view
 filledRepsColor : Set Color for Reps increment 

```
private var repsCounterView : RepetitionCounter!

func setRepsCounter() {
    repsCounterView = RepetitionCounter(frame : FRAME_VALUE)
    repsCounterView.defaultRepsColor = UIColor.lightGray
    repsCounterView.filledRepsColor = UIColor.red
    self.vwrepsCounter.addSubview(repsCounterView)
}

```

Once you will start getting response from onMessageReceived() delegate method, you can call below to set reps in Component

```
repsCounterView.setReps(total)

```
# Time Based Counter

This is the UI Component that is used for time based exercises 

```
private var timerView : TimeUnderLoadView!

func setTimeUnderLoadView() {
        timerView = TimeUnderLoadView(frame : FRAME_VALUE)
        timerView.totleSeconds = 10 //Set total seconds 
        timerView.progressTextColor = UIColor.black //set color for text which shows progress
        timerView.gradientColors = [color1, color2] //Change gradient color if required, pass 2 colors
        self.vwrepsCounter.addSubview(timerView)
}
```
Once you will start getting response from onMessageReceived() delegate method, you can call below to set remaining time 

```
timerView.setTimeUnderLoad(10 - seconds)

```
# Intensity Meter

This is the UI Component that is used for showing intensity 

```
private var intensityMeterView : IntensityMeterView!

func setIntensityMeterView() {
    intensityMeterView = IntensityMeterView(frame : FRAME_VALUE)
    self.vwrepsCounter.addSubview(intensityMeterView)
}

```
Once you will start getting response from onMessageReceived() delegate method, you can call below to set power values, power value ranges from 0 to 100.

```
intensityMeterView.setIntensity(Float(value))

```
To customise the color and font of Tone, cardio, power label, use below function.

```
intensityMeterView.customiseTitles(_ font : UIFont, textColor : UIColor)

```
