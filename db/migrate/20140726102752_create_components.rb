class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :project_name
      t.string :project_description
      t.string :release_id
      t.string :release_version
      t.string :project_id

      t.timestamps
    end
  end
end
