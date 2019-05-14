if [ -d "scripts" ]; then
cd scripts/
fi

cd ../src/PrebidMobile/
echo $PWD
echo "Running unit tests"
logFileUnitTests="build/reports/tests.html"

gem install xcpretty
set -o pipefail && xcodebuild test -project PrebidMobile.xcodeproj -scheme "PrebidMobileTests" -destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=11.0.1' | xcpretty

cd ../src/PrebidMobile/
echo $PWD
echo "Running swiftlint tests"
swiftlint --config .swiftlint.yml

echo "Running integration tests"
cd ../../example/Swift/PrebidDemo/
echo $PWD
xcodebuild test -workspace PrebidDemo.xcworkspace test -scheme "PrebidDemoTests" -destination 'platform=iOS Simulator,name=iPhone 8 Plus,OS=12.1' | xcpretty && exit ${PIPESTATUS[0]}

# Make the keychain the default so identities are found
security default-keychain -s ios-build.keychain

# Unlock the keychain
security unlock-keychain -p travis ios-build.keychain

# Set keychain locking timeout to 3600 seconds
security set-keychain-settings -t 3600 -u ios-build.keychain

