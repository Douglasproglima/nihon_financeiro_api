class CreateMovimentoConta < ActiveRecord::Migration[5.0]
  def change
    create_table :movimento_conta do |t|
      t.bigint :codigo
      t.datetime :data
      t.string :centro_custo
      t.decimal :valor, precision: 10, scale: 2
      t.decimal :saldo_anterior, precision: 10, scale: 2
      t.string :tipo
      t.references :conta, foreign_key: true
      t.references :user, foreign_key: true
      t.references :movimento, foreign_key: true

      t.timestamps
    end
  end
end
