class CreateMots < ActiveRecord::Migration[6.0]
  def change
    create_table :mots do |t|
      t.string :name
      t.date :duedate
      t.string :description
      t.string :tag
      t.string :emoticon
      t.references :user

      t.timestamps
    end
  end
end
