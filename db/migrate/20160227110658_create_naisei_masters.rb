class CreateNaiseiMasters < ActiveRecord::Migration
  def change
    create_table :naisei_masters do |t|
      t.integer :naisei_id
      t.string :naisei_name
      t.string :naisei_name_j

      t.timestamps null: false
    end
  end
end
