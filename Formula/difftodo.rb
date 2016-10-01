require "language/haskell"

class Difftodo < Formula
  include Language::Haskell::Cabal

  desc "Extract todo lists from code"
  homepage "https://github.com/jml/difftodo"
  url "https://hackage.haskell.org/package/difftodo-0.2.0/difftodo-0.2.0.tar.gz"
  sha256 "bdb2c473e15455ae2af37623283bb78fd6cf52491d86eb9a04b1241011fab899"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  depends_on "pcre" => :run
  depends_on "pkg-config" => :run

  def install
    install_cabal_package
  end

  test do
    # An empty git repository has no todos.
    system "git", "init", "."
    system "#{bin}/git-todo", "-f", "."
  end
end
