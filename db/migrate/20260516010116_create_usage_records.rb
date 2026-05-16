class CreateUsageRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :usage_records do |t|
      t.references :company, null: false, foreign_key: true
      t.string :action_type
      t.integer :quantity

      t.timestamps
    end
  end
end
