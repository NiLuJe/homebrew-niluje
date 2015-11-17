require 'formula'

class Verbiste < Formula
  homepage 'http://perso.b2b2c.ca/sarrazip/dev/verbiste.html'
  url 'http://perso.b2b2c.ca/sarrazip/dev/verbiste-0.1.42.tar.gz'
  sha256 'e40eee50725f5d9ad795610226c2dbacafc065ac382b7a1113d6c7dfd1e25897'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'

  def install
    # Apparently, we need to nudge the buildsystem a bit on OSX in order to *really* link against libiconv...
    ENV['LIBS'] = "-liconv"
    system './configure', "--prefix=#{prefix}",
                          "--with-libintl-prefix=#{prefix}/opt/gettext",
                          '--without-gtk-app',
                          '--without-gnome-app',
                          '--with-console-app'
    system 'make'
    system 'make', 'install'
  end
end
