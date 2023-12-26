cd DocCPublisher
xcrun xcodebuild build CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO docbuild \
    -scheme DocCPublisher \
    -destination 'generic/platform=iOS Simulator' \
    -derivedDataPath "$PWD/.derivedData"

xcrun docc process-archive transform-for-static-hosting \
    "$PWD/.derivedData/Build/Products/Debug-iphonesimulator/DocCPublisherDemo.doccarchive" \
    --output-path ".docs" \
    --hosting-base-path "DocCDemo"
    
echo '<script>window.location.href += "/documentation/doccpublisherdemo"</script>' > .docs/index.html
