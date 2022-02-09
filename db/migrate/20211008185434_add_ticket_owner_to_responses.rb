class AddTicketOwnerToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :ticket_owner, :string
  end
end
