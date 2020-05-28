class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :delay
      t.text :description
      t.boolean :priority
      t.boolean :completed
      t.references :mot

      t.timestamps
    end
  end
end
