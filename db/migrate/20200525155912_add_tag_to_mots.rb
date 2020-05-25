class AddTagToMots < ActiveRecord::Migration[6.0]
  def change
    add_column :mots, :tag, :boolean
  end
end
