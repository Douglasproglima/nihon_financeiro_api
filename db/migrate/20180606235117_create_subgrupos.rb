class CreateSubgrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :subgrupos do |t|
      t.string :nome
      t.string :referencia
      t.references :grupo_conta, foreign_key: true

      t.timestamps
    end
  end
end
