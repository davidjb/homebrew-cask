cask 'texpad' do
  if MacOS.version <= :mountain_lion
    version '1.6.14'
    sha256 '18fcbe93e77e5b5bc848172546962fcde397a26fd543efcc1054004369192f7e'

    url "https://download.texpadapp.com/apps/osx/updates/Texpad_#{version.dots_to_underscores}.zip"
  else
    version '1.7.38,148,9f8c3e4'
    sha256 'ee4cb219e7005c4faf44ed5774e8079ee1312ed6a0ab3fbd838427e084644cca'

    url "https://download.texpadapp.com/apps/osx/updates/Texpad_#{version.before_comma.dots_to_underscores}__#{version.after_comma.before_comma}__#{version.after_comma.after_comma}.dmg"
    appcast 'https://www.texpadapp.com/static-collected/upgrades/texpadappcast.xml',
            checkpoint: '8ea6caca17419b22cb56904ed12ee458058aa302b35a09d0e492f4724c44e999'
  end

  name 'Texpad'
  homepage 'https://www.texpad.com/osx'

  auto_updates true
  depends_on macos: '>= :lion'

  app 'Texpad.app'

  zap delete: [
                '~/Library/Application Support/Texpad',
                '~/Library/Caches/com.vallettaventures.Texpad',
                '~/Library/Cookies/com.vallettaventures.Texpad.binarycookies',
                '~/Library/Preferences/com.vallettaventures.Texpad.plist',
                '~/Library/Saved Application State/com.vallettaventures.Texpad.savedState',
              ]
end
