class UserImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: ['user_images']

  def public_id
    return "#{model.class.to_s.underscore}/#{model.username}"
  end 

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
