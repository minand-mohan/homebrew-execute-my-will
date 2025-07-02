class ExecuteMyWill < Formula
  desc "Your application description here"
  homepage "https://github.com/minand-mohan/execute-my-will"
  version "0.1.1"
  
  # Define the base URL for releases
  base_url = "https://github.com/minand-mohan/execute-my-will/releases/download/v#{version}"
  
  # Determine platform-specific binary name
  if OS.mac?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-macos-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "839552cd81236e6ff77af0c5194f583d0b0bb3d22e9518efeef974aea9ce1642"
    else
      binary_name = "execute-my-will-macos-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "a3579bb7ad14b8bfb843b4f15f342868d941be2eaa7539d127b90dad3c0dea77"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-linux-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "4c9583543744ca5f27cb8e53bd8787a0a520bcf67c51171c6c83ce4e04fee7fb"
    else
      binary_name = "execute-my-will-linux-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "2b8fc1f15c64c8f3ff43cc9e4c42886c58b7254f882a55f1025a6e40c7502dd5"
    end
  end

  def install
    # Get the original binary name based on platform
    original_name = if OS.mac?
                     Hardware::CPU.arm? ? "execute-my-will-macos-arm64" : "execute-my-will-macos-x64"
                   else
                     Hardware::CPU.arm? ? "execute-my-will-linux-arm64" : "execute-my-will-linux-x64"
                   end
    
    # Install the binary with the clean name
    bin.install original_name => "execute-my-will"
  end

  test do
    # Add a simple test to verify the binary works
    system "#{bin}/execute-my-will", "--help"
  end
end