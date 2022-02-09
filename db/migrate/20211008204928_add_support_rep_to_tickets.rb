class AddSupportRepToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :support_rep, :string
  end
end
