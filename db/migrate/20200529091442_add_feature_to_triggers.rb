class AddFeatureToTriggers < ActiveRecord::Migration[6.0]
  def change
    add_column :triggers, :feature, :string
  end
end
