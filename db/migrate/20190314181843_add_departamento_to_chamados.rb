class AddDepartamentoToChamados < ActiveRecord::Migration
  def change
    add_column :chamados, :departamento, :string
  end
end
