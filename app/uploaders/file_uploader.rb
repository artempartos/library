# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "system/uploads/content_document/#{mounted_as}/#{model.id}"
  end

  def filename
    if original_filename
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end
end