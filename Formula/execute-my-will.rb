class ExecuteMyWill < Formula
  desc "Your application description here"
  homepage "https://github.com/minand-mohan/execute-my-will"
  version "0.1.5"
  
  # Define the base URL for releases
  base_url = "https://github.com/minand-mohan/execute-my-will/releases/download/v#{version}"
  
  # Determine platform-specific binary name
  if OS.mac?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-macos-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "1df4321128cf4ba83a6af03f347378c9c46cb573b5131e740dda7d65bf619e96"
    else
      binary_name = "execute-my-will-macos-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "93ab0a7bccd480099834603f18ddf0f0ffcf89caa44b72454390361a2dbd8eed"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-linux-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "0274dd1b0a6ce4ac6cbde811efb705b7fcb0170091fa27c7863ecfd6a918dea7"
    else
      binary_name = "execute-my-will-linux-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "11ad05bfff8b398ecf9abe1cd80f13d7b590d0d7086d60618283e7b82f86384d"
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
