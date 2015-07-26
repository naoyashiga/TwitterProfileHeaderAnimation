# Twitter Profile Header Animation  
This is a very simple scroll animation like Twitter profile page animation.


# Reference
Implementing the Twitter iOS App UI - Think & Build  
http://www.thinkandbuild.it/implementing-the-twitter-ios-app-ui/  

How to create an interactive blur effect in iOS8 • Five  
http://five.agency/how-to-create-an-interactive-blur-effect-in-ios8/  

# Library  
## Why you change UIVisualEffectView alpha?  

First, I changed UIVisualEffectView alpha. I got this error message and blurred image got glitch when scrolling.  
```
<UIVisualEffectView 0x7fd1d0440a20> is being asked to animate its opacity. This will cause the effect to appear broken until opacity returns to 1.
```

```
When using the UIVisualEffectView class, avoid alpha values that are less than 1. Creating views that are partially transparent causes the system to combine the view and all the associated subviews during an offscreen render pass. UIVisualEffectView objects need to be combined as part of the content they are layered on top of in order to look correct. Setting the alpha to less than 1 on the visual effect view or any of its superviews causes many effects to look incorrect or not show up at all.
```
UIVisualEffectView Class Reference  
https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIVisualEffectView/  

## SwiftUIImageEffects  
So I started to use SwiftUIImageEffects.  

globchastyy/SwiftUIImageEffects  
https://github.com/globchastyy/SwiftUIImageEffects

# Photo  
Free stock photo of sea, sky, beach  
http://www.pexels.com/photo/sea-sky-beach-holiday-1106/

