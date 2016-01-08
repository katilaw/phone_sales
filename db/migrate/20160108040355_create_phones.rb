class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.belongs_to :manufacturer, null: false
      t.integer :year, null: false
      t.integer :battery_life, null: false
      t.string :description
    end
  end
end
