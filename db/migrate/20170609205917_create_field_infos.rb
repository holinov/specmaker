class CreateFieldInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :field_infos do |t|
      t.string :name
      t.integer :sort_order
      t.string :unit_name

      t.timestamps
    end
  end
end
