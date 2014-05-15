require 'formula'

class Verbiste < Formula
  homepage 'http://perso.b2b2c.ca/sarrazip/dev/verbiste.html'
  url 'http://perso.b2b2c.ca/sarrazip/dev/verbiste-0.1.41.tar.gz'
  sha1 '39d6199bdf962c714de47b531177cb27d53e4a35'

  depends_on 'pkg-config' => :build
  depends_on 'gettext'

  def install
    system './configure', "--prefix=#{prefix}",
                          "--with-libintl-prefix=#{prefix}/opt/gettext",
                          '--without-gtk-app',
                          '--without-gnome-app',
                          '--with-console-app'
    system 'make'
    system 'make', 'install'
  end
end
