class CoverUploader < ApplicationUploader
  process :resize_to_fit => [600, 600]

  version :thumb do
    process :resize_to_fill => [300, 300]
  end
end
