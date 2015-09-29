require 'formula'

class Verbiste < Formula
  homepage 'http://perso.b2b2c.ca/sarrazip/dev/verbiste.html'
  url 'http://perso.b2b2c.ca/sarrazip/dev/verbiste-0.1.42.tar.gz'
  sha1 '71fd1d99faba975dbd8e94d2da6be00f26f418d8'

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
