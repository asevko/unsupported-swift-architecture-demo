# That branch doesn't use pods and doesn't have error

This repository demonstrates `unsupported Swift architecture` error, that appears in generated `-Swift.h` file
for `Intel (x86_64)` architecture.

![Error example](https://github.com/asevko/unsupported-swift-architecture-demo/assets/15818523/72c2af80-3516-4189-ba30-6a64967aaaac)

## Problem

[Generated swift header](/products/MixedFramework.xcframework/ios-arm64_x86_64-simulator/MixedFramework.framework/Headers/MixedFramework-Swift.h) doesnt contain define for `x86_64` architecture.
That leads to `unsupported Swift architecture` error, while building target, taht uses xcframework, for simulator, on Intel mac.

For creating xcframeworks I've followd instructions from [Creating a multiplatform binary framework bundle](https://developer.apple.com/documentation/Xcode/creating-a-multi-platform-binary-framework-bundle).
I've tried to resovle error via [TN3117: Resolving architecture build errors on Apple silicon](https://developer.apple.com/documentation/technotes/tn3117-resolving-build-errors-for-apple-silicon/).

### Expected behaviour

[Generated swift header](/products/MixedFramework.xcframework/ios-arm64_x86_64-simulator/MixedFramework.framework/Headers/MixedFramework-Swift.h) contains define for `x86_64` fot alongside with `arm64`.

## Getting started

To build project you need:

1. `open MixedFramework.xcworkspace`

If you want to regenerate xcframework:

1. `./create-xcframework.sh` - generated framework will appear in [products](/products/)
1. `open MixedFramework.xcworkspace`
1. Add generated [MixedFramework.xcframework](/products/MixedFramework.xcframework/) to `MixedXCFrameworkConsumer` target:
    * Select `MixedXCFrameworkConsumer` project
    * Go to `Build Phases` tab
    * Tap `+` under `Link Binary With Libraries`
    * Tap `Add Other..` -> `Add Files`
    * Select [MixedFramework.xcframework](/products/MixedFramework.xcframework/)
    * Tap `Add`

## See also

I've found common issues on stackoverflow and apple forum, but there is no working solution in any of them.  
Common issues:

* [When compiling with Xcode14 I get Error unsupported Swift architecture. How to solve this?](https://stackoverflow.com/questions/74517344/when-compiling-with-xcode14-i-get-error-unsupported-swift-architecture-how-to-s)
* [Xcode 14.2 build fail](https://stackoverflow.com/questions/75922282/xcode-14-2-build-fail)
* [Error unsupported Swift architecture.](https://stackoverflow.com/questions/74517344/when-compiling-with-xcode14-i-get-error-unsupported-swift-architecture-how-to-s)
