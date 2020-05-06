class Article < ApplicationRecord
  validates :title, :body, presence: true, length: { minimum: 5 }

  enum topic: {
    anxiety: 0,
    depression: 1,
    lifestyle: 2,
    pyschological_nalysis: 3
  }

end
