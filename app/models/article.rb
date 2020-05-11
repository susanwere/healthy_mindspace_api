class Article < ApplicationRecord
  validates :title, :body, presence: true, length: { minimum: 5 }
  validates :title, :subtitle, uniqueness: true

  enum topic: {
    anxiety: 0,
    depression: 1,
    lifestyle: 2,
    pyschological_analysis: 3
  }

  mount_uploader :article_image, ArticleImageUploader

end
