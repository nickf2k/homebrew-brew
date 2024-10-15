class Gppro < Formula
  desc "Manage applets and keys on Java Cards"
  homepage "https://github.com/martinpaljak/GlobalPlatformPro"

  version "20.08.12"

  url "https://github.com/martinpaljak/GlobalPlatformPro/releases/download/v20.08.12/gp.jar"
  sha256 "a2f0c46e1c1cb533494745987de759d6c8bbcd86ce6c9163f2f7cdfeaa2b2181"

  # head "git@github.com:martinpaljak/GlobalPlatformPro.git", branch: "master"

  depends_on "maven" => :build
  depends_on "openjdk@17"

  def install
    if build.head?
      system Formula["maven"].bin/"mvn", "package"
      prefix.install "tool/target/gp.jar"
    else
      prefix.install "gp.jar"
    end
    bin.write_jar_script prefix/"gp.jar", "gp"
  end
end
