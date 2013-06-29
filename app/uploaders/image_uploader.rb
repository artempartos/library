# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "system/uploads/content_image/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fit => [200, 200]

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end