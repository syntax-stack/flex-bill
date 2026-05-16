class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.references :company, null: false, foreign_key: true
      t.integer :subtotal_cents
      t.integer :vat_cents
      t.integer :total_cents
      t.string :status
      t.datetime :issued_at

      t.timestamps
    end
  end
end
