require 'fastlane/action'
require_relative '../helper/ipa_install_plist_generate_helper'

module Fastlane
  module Actions
    class IpaInstallPlistGenerateAction < Action
      def self.run(params)
        require 'plist'

        output            = params[:output]
        url               = params[:url]
        bundle_identifier = params[:bundle_identifier]
        bundle_version    = params[:bundle_version]
        title             = params[:title]
        display_image     = params[:display_image]
        full_size_image   = params[:full_size_image]

        assets = [
          {
            'kind' => 'software-package',
            'url' => url
          }
        ]

        assets << {
          'kind' => 'display-image',
          'url' => display_image
        } if display_image

        assets << {
          'kind' => 'full-size-image',
          'url' => full_size_image
        } if full_size_image

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
        plist_string = Plist::Emit.dump(plist_hash)

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
            type: String,
            verify_block: proc do |value|
              UI.user_error!("❌ nil or empty") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :url,
            description: "ipa download url",
            type: String,
            verify_block: proc do |value|
              UI.user_error!("❌ nil or empty") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :bundle_identifier,
            description: "ios app's bundle identifier",
            type: String,
            verify_block: proc do |value|
              UI.user_error!("❌ nil or empty") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :bundle_version,
            description: "ios app's bundle version",
            type: String,
            verify_block: proc do |value|
              UI.user_error!("❌ nil or empty") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :title,
            description: "ipa file title",
            type: String,
            verify_block: proc do |value|
              UI.user_error!("❌ nil or empty") unless (value and not value.empty?)
            end
          ),
          FastlaneCore::ConfigItem.new(
            key: :display_image,
            description: "eg: https://example.com/app.png",
            type: String,
            optional: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :full_size_image,
            description: "eg: https://example.com/app.png",
            type: String,
            optional: true
          )
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
