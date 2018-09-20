class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date, null: true, default: nil
      t.integer :mark, default: 0
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
