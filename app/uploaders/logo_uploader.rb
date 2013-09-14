class LogoUploader < BaseUploader
  process :resize_to_fit => [200, 200]

  version :thumb do
    process :resize_to_fill => [30,30]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
