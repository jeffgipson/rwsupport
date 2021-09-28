class Post < ApplicationRecord
  belongs_to :category
  has_rich_text :body
  has_one_attached :image
end
