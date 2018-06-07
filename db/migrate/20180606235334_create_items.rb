class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :nome
      t.string :referencia
      t.string :tipo
      t.references :subgrupo, foreign_key: true

      t.timestamps
    end
  end
end
