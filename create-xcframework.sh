
if [[ -d build ]]; then
    rm -rf build
fi

sdks=("iOS" "iOS Simulator")
scheme=MixedFramework
configuration=Release

archivesOptions=""

for sdk in "${sdks[@]}"; do
    joinedSDK=${sdk[*]// /-}
    archivePath="build/archives/$scheme-$joinedSDK-$configuration.xcarchive"
    
    xcodebuild archive \
        -workspace MixedFramework.xcworkspace \
        -configuration $configuration \
        -scheme $scheme \
        -destination "generic/platform=$sdk" \
        -archivePath $archivePath \
        -derivedDataPath "build/derived" \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        SKIP_INSTALL=NO
        
    archivesOptions="$archivesOptions -archive $archivePath -framework MixedFramework.framework"
done

output="products/MixedFramework.xcframework"

if [[ -d $output ]]; then
    rm -rf $output
fi

xcodebuild -create-xcframework $archivesOptions -output $output
