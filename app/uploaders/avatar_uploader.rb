class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    'assets/images/uploads'
  end

  def content_type_allowlist
    /image\//
  end

  def extension_allowlist
    ['jpg', 'jpeg', 'gif', 'png']
  end

  process resize_to_fill: [300, 300]
end
