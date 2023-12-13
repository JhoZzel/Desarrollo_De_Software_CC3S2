class CreateMyModels < ActiveRecord::Migration
  def change
    create_table :my_models do |t|
      t.string :model
      t.string :name

      t.timestamps null: false
    end
  end
end
