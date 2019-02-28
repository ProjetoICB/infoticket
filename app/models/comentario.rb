class Comentario < ActiveRecord::Base
  belongs_to :chamado
  belongs_to :user
  belongs_to :usuario
  # attr_accessible :conteudo, :tecnico, :chamado_id, :user_id, :respPorEmail
  attr_accessible :conteudo, :chamado_id, :user_id,:usuario_id,  :respPorEmail


  validates_confirmation_of :conteudo

end
