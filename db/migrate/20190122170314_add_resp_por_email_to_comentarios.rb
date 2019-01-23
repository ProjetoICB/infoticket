class AddRespPorEmailToComentarios < ActiveRecord::Migration
  def self.up
     add_column :comentarios, :respPorEmail, :boolean
  end

  def self.down
    remove_column :comentarios, :respPorEmail
  end
end
