class Gppro < Formula
  desc "Manage Global Platform Java Cards"
  homepage "https://github.com/martinpaljak/GlobalPlatformPro"
  version "20.08.12"
  url "https://github.com/martinpaljak/GlobalPlatformPro/releases/download/v20.08.12/gp.jar"
  sha256 "a2f0c46e1c1cb533494745987de759d6c8bbcd86ce6c9163f2f7cdfeaa2b2181"
#  url "https://github.com/martinpaljak/GlobalPlatformPro/archive/refs/tags/v20.01.23.zip"
#  sha256 "d3e2c17754ae7aaec7e624a912967cb986ce185387b473a407466a16dd96745a"

  head "https://github.com/martinpaljak/GlobalPlatformPro.git", branch: "master"
 
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
