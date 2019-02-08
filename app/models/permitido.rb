class Permitido < ActiveRecord::Base

  attr_accessible :usuario_id, :perfil_id

  belongs_to :usuario
  belongs_to :perfil

end
