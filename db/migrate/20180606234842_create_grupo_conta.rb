class CreateGrupoConta < ActiveRecord::Migration[5.0]
  def change
    create_table :grupo_conta do |t|
      t.string :nome
      t.bigint :referencia

      t.timestamps
    end
  end
end
