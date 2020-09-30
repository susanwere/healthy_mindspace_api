class Article < ApplicationRecord
  enum topic: {
    anxiety: 0,
    depression: 1,
    lifestyle: 2,
    pyschological_analysis: 3
  }

  validate_enum_attribute :topic

  mount_uploader :article_image, ArticleImageUploader

end
