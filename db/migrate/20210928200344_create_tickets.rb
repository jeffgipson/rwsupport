class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
