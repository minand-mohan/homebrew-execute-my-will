class ExecuteMyWill < Formula
  desc "Your application description here"
  homepage "https://github.com/minand-mohan/execute-my-will"
  version "0.1.4"
  
  # Define the base URL for releases
  base_url = "https://github.com/minand-mohan/execute-my-will/releases/download/v#{version}"
  
  # Determine platform-specific binary name
  if OS.mac?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-macos-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "cbadc90c4e3a7e85e6b484a00bb188098fcc90e5047f5e4f58af743026d5d938"
    else
      binary_name = "execute-my-will-macos-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "f012c960c63d053790ed01d8ef587137c8d14d3a30ed29dc2f9332fc75d421b6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-linux-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "8a2e18bbf320e87e443350ae0d575a5a9c3da6851ab7f2e5a4f1f244b5db8874"
    else
      binary_name = "execute-my-will-linux-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "0b36d951c2327abd09e158769818040fcd105c40f3455ec3d79ee02f8d32813f"
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
