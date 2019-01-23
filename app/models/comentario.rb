class Comentario < ActiveRecord::Base
  belongs_to :chamado
  belongs_to :user
  attr_accessible :conteudo, :tecnico, :chamado_id, :user_id, :respPorEmail


  validates_confirmation_of :conteudo

end
