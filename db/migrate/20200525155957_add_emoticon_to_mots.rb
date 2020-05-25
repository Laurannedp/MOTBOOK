class AddEmoticonToMots < ActiveRecord::Migration[6.0]
  def change
    add_column :mots, :emotigon, :string
  end
end
