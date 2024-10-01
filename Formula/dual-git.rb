class DualGit < Formula
    desc "Script that manages multiple SSH configurations for Git"
    homepage "https://github.com/HalilSacpapa/homebrew-dual-git"
    url "https://raw.githubusercontent.com/HalilSacpapa/homebrew-dual-git/refs/heads/main/dual_git.sh"
    sha256 "46086d9a5422fd4886d7cbd75fffa0cc59570196db5beaf9a5358c3e395612b3"

    version "1.0"

    def install
      bin.install "dual_git.sh" => "dgit"
    end

    test do
      system "#{bin}/dgit", "--help"
    end
  end
