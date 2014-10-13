class CreateContractHistories < ActiveRecord::Migration
  def change
    create_table :contract_histories do |t|
      t.integer :personId
      t.date :contractDate
      t.date :finalContractDate

      t.timestamps
    end
  end
end
