class Perfil < ActiveRecord::Base

  attr_accessible :tipo

  has_many :permitidos
  has_many :usuarios, through: :permitidos



end
