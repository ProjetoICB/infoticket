class AlterTableComentarios < ActiveRecord::Migration
  def up
    remove_column :comentarios, :tecnico
    remove_column :comentarios, :chamados_id
    add_column :comentarios, :usuario_id, :integer
  end

  def down
    add_column :comentarios, :tecnico, :string
    add_column :comentarios, :chamados_id, :integer
    remove_column :comentarios, :usuario_id
  end
end
