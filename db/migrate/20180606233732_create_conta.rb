class CreateConta < ActiveRecord::Migration[5.0]
  def change
    create_table :conta do |t|
      t.bigint :codigo
      t.string :nome
      t.integer :numero
      t.integer :agencia
      t.decimal :saldo, precision: 10, scale: 2
      t.decimal :saldo_inicial, precision: 10, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
