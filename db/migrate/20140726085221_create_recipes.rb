class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source_environment_id
      t.string :source_environment_name
      t.string :created_by

      t.timestamps
    end
  end
end
