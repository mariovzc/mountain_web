class CreatePaymentDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_descriptions do |t|
      t.references :payment, foreign_key: true
      t.integer :month
      t.text :comment
      t.boolean :paid_up
      t.references :payment_type, foreign_key: true

      t.timestamps
    end
  end
end
