# xtravision-swift-package

# Using Swift Package Manager

This Swift Package manager is created for checking assessments. Currently we are supporting below assessments.

GLUTE_BRIDGE, QUADS_STRETCH, OVERHEAD_STRETCH, SINGLE_LEG_KNEE_HUGS, DOUBLE_LEG_KNEE_HUGS, THORACIC_ROTATION, PECTORAL_STRETCH, BOW_AND_ARROW, ROTATION_STRETCH, HIP_FLEXOR_QUAD_STRETCH, BANDED_ALTERNATING_DIAGNOLS, SHOULDER_SCAPTION, HALF_SQUAT, KNEE_ROCKING, NECK_FLEXORS, BANDED_BOW_AND_ARROW, BANDED_EXTERNAL_ROTATION, BANDED_T, BANDED_W, BANDED_PASS_THROUGH

Add this package dependency in your Xcode project by following steps.
Create New Xcode project. File -> New -> Project -> App -> (Name of your project) ... complete remaining steps
File -> Swift Packages -> Add Package Dependency -> Enter:

 [xtravision-package-url](https://github.com/xtravision-ai/xtravision-swift-package.git)

repository url -> Next -> Select Branch(master) and complete the remaining steps and your package dependency will be added in your xcode project.
Clean and build your project.

# Manual Installation

Open Xcode peoject.
Download framework from :
 [xtravision-framework-url](https://github.com/xtravision-ai/xtravision-swift-framework/releases/download/v1.0.0/XtraVisionAI.xcframework.zip)
 
Now in your xcode project select your TARGET -> General Tab -> Drag and Drop the downloaded folder in Frameworks, Libraries and Embedded Content.
Now build your project.

# How to use this downloaded Library?

Now follow the steps in your controlller to get the assessment results from camera frames 
```
import XtraVisionAI

//Access assessment class and add delegate. Also inherit this delegate XtraVisionAIDelegate
let assessment = XtraVisionAIClass.shared
assessment.delegate = self

```

After starting camera session to connect the XTRAVision's backend

```
//  Prepare Initial Object
let assessmentConfig = XtraVisionAssessmentConfig(repsThreshold, grace_time_threshold: grace_time_threshold)
let connectionData = XtraVisionConnectionData(authToken, assessmentName: assessmentName, assessmentConfig: assessmentConfig)
val requestData = XtraVisionRequestData(isPreJoin)
let libData = XtraVisionLibData(false)//Skeleton parameter, todo: work is pending for this

// create an object and initiate the Assessment process
xtraVisionMgr.configureData(connectionData, requestData: requestData, libData: libData)

```

To disconnect from socket after stop camera session, Use

```
xtraVisionMgr.disconnectSocket()

```

Once you will get sample buffer from camera frames, convert that into UIImage format and send that UIImage to below function, this is continuous process

```
xtraVisionMgr.detectPose(image: image)

```

So once you start doing pose, you will get result in below delegate method. You can use this result in your app.

```
func onMessageReceived(_ message: String) {
    print("message: \(message)")
}

```
