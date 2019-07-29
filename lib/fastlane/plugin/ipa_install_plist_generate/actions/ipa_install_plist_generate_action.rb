require 'fastlane/action'
require_relative '../helper/ipa_install_plist_generate_helper'

module Fastlane
  module Actions
    module SharedValues
      IPA_INSTALL_PLISTG_ENERATE_PLIST_HASH = :IPA_INSTALL_PLISTG_ENERATE_PLIST_HASH
      IPA_INSTALL_PLISTG_ENERATE_PLIST_STRING = :IPA_INSTALL_PLISTG_ENERATE_PLIST_STRING
    end 
    class IpaInstallPlistGenerateAction < Action
      def self.run(params)
        require 'plist'

        output = params[:output]
        url = params[:url]
        bundle_identifier = params[:bundle_identifier]
        bundle_version = params[:bundle_version]
        display_image = params[:display_image]
        full_size_image = params[:full_size_image]
        title = params[:title]

        assets = [
          {
            'kind' => 'software-package',
            'url' => url
          }, 
          {
            'kind' => 'display-image',
            'url' => display_image
          },
          {
            'kind' => 'full-size-image',
            'url' => full_size_image
          }
        ]

        metadata = {
          'bundle-identifier' => bundle_identifier,
          'bundle-version' => bundle_version,
          'kind' => 'software',
          'title' => title
        }

        plist_hash = {
          items: [{
            'assets' => assets,
            'metadata' => metadata
          }]
        }
        Actions.lane_context[SharedValues::IPA_INSTALL_PLISTG_ENERATE_PLIST_HASH] = plist_hash
        
        plist_string = Plist::Emit.dump(plist_hash)
        Actions.lane_context[SharedValues::IPA_INSTALL_PLISTG_ENERATE_PLIST_STRING] = plist_string

        File.open(output, 'w') do |f|
          f.write(plist_string)
        end
      end

      def self.description
        "iOS ipa enterprise install plist generate plugn"
      end

      def self.authors
        ["xiongzenghui"]
      end

      def self.return_value
        
      end

      def self.details
        "iOS ipa enterprise install plist generate plugn"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :output,
            description: "where save generate ipa plist file",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :url,
            description: "ipa download url",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :bundle_identifier,
            description: "ios app's bundle identifier",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :bundle_version,
            description: "ios app's bundle version",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :display_image,
            description: "eg: https://example.com/app.png",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :full_size_image,
            description: "eg: https://example.com/app.png",
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :title,
            description: "ipa file title",
            type: String
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
