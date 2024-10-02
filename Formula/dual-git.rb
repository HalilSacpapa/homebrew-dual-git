class DualGit < Formula
    desc "Script that manages multiple SSH configurations for Git"
    homepage "https://github.com/HalilSacpapa/homebrew-dual-git"
    url "https://raw.githubusercontent.com/HalilSacpapa/homebrew-dual-git/refs/heads/main/dual_git.sh"
    sha256 "2cd29f83e4cb83c28d2724308ce58ff4068f5537987003a6ea77ca2228f215c6"

    version "1.0"

    def install
      bin.install "dual_git.sh" => "dgit"
    end

    test do
      system "#{bin}/dgit", "--help"
    end
  end
