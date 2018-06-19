class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :razao_social
      t.string :cnpj
      t.string :telefone
      t.string :telefone2
      t.string :contato
      t.string :email
      t.boolean :ativo, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
