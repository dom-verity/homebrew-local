# coding: utf-8
##################################################################################
# Name: wasm-pack.rb
# Description:
#   Homebrew formula to install the wasm-pack Rust → Wasm workflow tool. This
#   tool seeks to be a one-stop shop for building and working with rust-
#   generated WebAssembly that you would like to interop with JavaScript, in the
#   browser or with Node.js.
# Author: Dominic Verity
# Commenced: 16 August 2019
##################################################################################

class WasmPack < Formula
  desc "Rust → WebAssembly workflow tool."
  homepage "https://github.com/rustwasm/wasm-pack"
  url "https://github.com/rustwasm/wasm-pack/releases/download/v0.8.1/wasm-pack-v0.8.1-x86_64-apple-darwin.tar.gz"
  version "0.8.1"
  sha256 "0da91445eec6eb27feb3d313330594be32e7bc35784e7b3c00659b0d741cf610"

  def install
    bin.install "wasm-pack"
    prefix.install "LICENSE-APACHE"
    prefix.install "LICENSE-MIT"
    prefix.install "README.md"
  end

  test do
    system "#{bin}/wasm-pack -V"
  end
end
