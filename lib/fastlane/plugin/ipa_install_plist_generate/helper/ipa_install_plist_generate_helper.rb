require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class IpaInstallPlistGenerateHelper
      # class methods that you define here become available in your action
      # as `Helper::IpaInstallPlistGenerateHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the ipa_install_plist_generate plugin helper!")
      end
    end
  end
end
