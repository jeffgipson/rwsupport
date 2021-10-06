# == Schema Information
#
# Table name: tickets
#
#  id         :bigint           not null, primary key
#  status     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Ticket < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_one_attached :image
end
