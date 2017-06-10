class CreateWorkInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :work_infos do |t|
      t.string :name
      t.float :amount
      t.string :units
      t.decimal :price, precision: 8, scale: 2
      t.references :entry_info, foreign_key: true

      t.timestamps
    end
  end
end
