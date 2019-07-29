describe Fastlane::Actions::IpaInstallPlistGenerateAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ipa_install_plist_generate plugin is working!")

      Fastlane::Actions::IpaInstallPlistGenerateAction.run(nil)
    end
  end
end
