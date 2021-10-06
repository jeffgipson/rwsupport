# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ticket_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_responses_on_ticket_id  (ticket_id)
#  index_responses_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (ticket_id => tickets.id)
#  fk_rails_...  (user_id => users.id)
#
class Response < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  has_rich_text :body
  has_one_attached :image
end
