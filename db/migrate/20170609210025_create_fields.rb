class CreateFields < ActiveRecord::Migration[5.0]
  def change
    create_table :fields do |t|
      t.belongs_to :field_info, foreign_key: true
      t.belongs_to :entry_info, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
