class AddTimestampsToArticles < ActiveRecord::Migration[7.0]
  def change
    #add_column :nome_da_tabela, :nome_da-coluna, :tipo_da_coluna
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
