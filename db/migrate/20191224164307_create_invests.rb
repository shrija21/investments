class CreateInvests < ActiveRecord::Migration[5.1]
  def change
    create_table :invests do |t|
      t.decimal :amount, precision: 20, scale: 6
      t.date :selected_date

      t.timestamps
    end
  end
end
