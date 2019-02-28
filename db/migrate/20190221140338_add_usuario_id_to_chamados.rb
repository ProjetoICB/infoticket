class AddUsuarioIdToChamados < ActiveRecord::Migration
  def self.up
    add_column :chamados, :usuario_id, :integer
  end

  def self.down
    remove_column :chamados, :usuario_id
  end
end
