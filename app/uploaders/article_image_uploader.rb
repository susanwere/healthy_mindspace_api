class ArticleImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process tags: ['article_images']

  def public_id
    return "#{model.class.to_s.underscore}/#{Rails.env}/#{model.title}"
  end 

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.title}"
  end
end