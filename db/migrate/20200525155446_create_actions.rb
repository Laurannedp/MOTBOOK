class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :url
      t.references :task

      t.timestamps
    end
  end
end
