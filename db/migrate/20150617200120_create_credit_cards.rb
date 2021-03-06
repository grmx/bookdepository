class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :number, limit: 16
      t.string :exp_month, limit: 2
      t.string :exp_year, limit: 2
      t.string :firstname
      t.string :lastname
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
