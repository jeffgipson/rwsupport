class Response < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  has_rich_text :body
  has_one_attached :image
end
