class CreateMoviegoers < ActiveRecord::Migration[6.0]
  def change
    create_table :moviegoers do |t|
      
      t.timestamps
    end
  end
end
