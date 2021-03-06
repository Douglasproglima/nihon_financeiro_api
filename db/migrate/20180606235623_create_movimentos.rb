class CreateMovimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :movimentos do |t|
      t.datetime :data
      t.string :centro_custo
      t.decimal :valor, precision: 10, scale: 2
      t.string :observacao
      t.string :tipo
      t.references :item, foreign_key: true
      t.references :conta, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
