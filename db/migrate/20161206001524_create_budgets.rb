class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.boolean :status, default: false
      t.string :item
      t.float :price


      t.timestamps
    end
  end
end
