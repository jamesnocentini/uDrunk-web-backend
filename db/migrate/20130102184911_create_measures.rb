class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.integer :reading
      t.references :user

      t.timestamps
    end
    
    add_index :measures, :user_id
  end
end
