require 'formula'

class Dcadec < Formula
  homepage 'https://github.com/foo86/dcadec'
  url 'http://files.ak-team.com/niluje/gentoo/dcadec-0.0.0_p20151117.tar.xz'
  sha256 '68c7c24c0951ccfb93c1b8724e7f96aeee48e4ad8c19c5949311e4140e7bc876'

  head 'https://github.com/foo86/dcadec.git'

  def install
    system 'make', 'all'
    system 'make', "PREFIX=#{prefix}", 'install'
  end
end
