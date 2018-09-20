class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :name
      t.date :date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
