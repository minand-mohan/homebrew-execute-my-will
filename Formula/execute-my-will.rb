class ExecuteMyWill < Formula
  desc "Your application description here"
  homepage "https://github.com/minand-mohan/execute-my-will"
  version "0.3.0"
  
  # Define the base URL for releases
  base_url = "https://github.com/minand-mohan/execute-my-will/releases/download/v#{version}"
  
  # Determine platform-specific binary name
  if OS.mac?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-macos-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "2ff3f09aaeaf794839bb7e5fd95994e894173ea2982cc83ed31c37d6fd507668"
    else
      binary_name = "execute-my-will-macos-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "875a90a7840b9472e1380b278a80f71500321c26994f24d7dd148d0a590810dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      binary_name = "execute-my-will-linux-arm64"
      url "#{base_url}/#{binary_name}"
      sha256 "baa5d278feaaa605588419120c7623d08b4a9dedbbcee35bb9fc3be94c3b7e82"
    else
      binary_name = "execute-my-will-linux-x64"
      url "#{base_url}/#{binary_name}"
      sha256 "31afc2a391524ced3fc556370dc217b6c8f6211a9649af8253195f856aeb10b9"
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
