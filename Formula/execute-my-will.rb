class ExecuteMyWill < Formula
  desc "Your application description here"
  homepage "https://github.com/minand-mohan/execute-my-will"
  version "0.1.3"
  
  # Define the base URL for releases
  base_url = "https://github.com/minand-mohan/execute-my-will/releases/download/v#{version}"
  
  # Determine platform-specific binary name
  if OS.mac?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-macos-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "82b13ade8bcf8f9d59f77c475f3e00cd3135c291a8884f39d0e933c16a1e6f88"
    else
      binary_name = "execute-my-will-macos-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "82b13ade8bcf8f9d59f77c475f3e00cd3135c291a8884f39d0e933c16a1e6f88"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-linux-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "5d2d14e43d5363bb68a66844ed207eea43f9bebe8b9aee037154658087dc9f40"
    else
      binary_name = "execute-my-will-linux-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "dec3da5ca42ceaeac77b7cd1d88360d36638f9ee7a1c87ca9bf28004d6898d34"
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
