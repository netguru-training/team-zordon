class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name, null: false
      t.text :description
      t.string :small_name
      t.text :small_description
      t.boolean :active, default: true
      t.string :days

      t.timestamps null: false
    end
  end
end
