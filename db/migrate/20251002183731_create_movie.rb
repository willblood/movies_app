class CreateMovie < ActiveRecord::Migration[7.1]
  def change
    create_table :movies, id: :uuid do |t|
      t.string :title, null: false
      t.date :year, null: false
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
