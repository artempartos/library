class CoverUploader < ApplicationUploader
  process resize_to_fit: [600, 900]

  version :thumb do
    process resize_to_fit: [300, 450]
  end
end
