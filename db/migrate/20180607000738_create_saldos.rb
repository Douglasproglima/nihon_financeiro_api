class CreateSaldos < ActiveRecord::Migration[5.0]
  def change
    create_table :saldos do |t|
      t.datetime :data
      t.decimal :saldo, precision: 10, scale: 2

      t.timestamps
    end
  end
end
