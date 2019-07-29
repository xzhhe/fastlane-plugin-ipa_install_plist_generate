# ipa_install_plist_generate plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-ipa_install_plist_generate)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-ipa_install_plist_generate`, add it to your project by running:

```bash
fastlane add_plugin ipa_install_plist_generate
```

## About ipa_install_plist_generate

iOS ipa enterprise install plist generate plugn

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

```ruby
lane :test do
  ipa_install_plist_generate(
    output: '/Users/xiongzenghui/Desktop/ipa.plist',
    url: 'https://updown.in.xx.com/download/xx-6.5.0-189-20190726_101548.ipa',
    bundle_identifier: 'com.cn.xzh',
    bundle_version: '9.9.9',
    display_image: 'https://example.com/app.png',
    full_size_image: 'https://example.com/app.png',
    title: 'test app'
  )
end
```

generate plist for below: 

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>items</key>
	<array>
		<dict>
			<key>assets</key>
			<array>
				<dict>
					<key>kind</key>
					<string>software-package</string>
					<key>url</key>
					<string>https://updown.in.xx.com/download/xx-6.5.0-189-20190726_101548.ipa</string>
				</dict>
				<dict>
					<key>kind</key>
					<string>display-image</string>
					<key>url</key>
					<string>https://example.com/app.png</string>
				</dict>
				<dict>
					<key>kind</key>
					<string>full-size-image</string>
					<key>url</key>
					<string>https://example.com/app.png</string>
				</dict>
			</array>
			<key>metadata</key>
			<dict>
				<key>bundle-identifier</key>
				<string>com.cn.xzh</string>
				<key>bundle-version</key>
				<string>9.9.9</string>
				<key>kind</key>
				<string>software</string>
				<key>title</key>
				<string>test app</string>
			</dict>
		</dict>
	</array>
</dict>
</plist>
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
