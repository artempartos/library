class LogoUploader < ApplicationUploader
  process resize_to_fit: [200, 200]

  version :thumb do
    process resize_to_fill: [50, 50]
  end

end
