class CreateNavData < ActiveRecord::Migration[5.1]
  def change
    create_table :nav_data do |t|
      t.integer :scheme_code
      t.string :scheme_name
      t.string :ISIN_growth
      t.string :ISIN_div_reinvestment
      t.decimal :net_asset_value, precision: 20, scale: 6
      t.decimal :repurchase_price, precision: 20, scale: 6
      t.decimal :sale_price, precision: 20, scale: 6
      t.date :current_date

      t.timestamps
    end
  end
end
