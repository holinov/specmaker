class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :project, foreign_key: true
      t.references :entry_info, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
