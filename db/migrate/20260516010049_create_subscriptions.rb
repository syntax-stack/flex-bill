class CreateSubscriptions < ActiveRecord::Migration[8.1]
  def change
    create_table :subscriptions do |t|
      t.references :company, null: false, foreign_key: true
      t.string :plan_name
      t.integer :base_price_cents
      t.integer :included_usage
      t.integer :overage_rate_cents

      t.timestamps
    end
  end
end
