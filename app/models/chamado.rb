class Chamado < ActiveRecord::Base
  attr_accessible :descricao, :titulo, :status, :user_id, :type_id, :sala, :predio, :tecnico, :patrimonio, :obs

  belongs_to :user
  belongs_to :usuario
  has_many :comentarios,   dependent: :destroy

  def self.total_geral(date, predio) #def para o grafico de chamados busca pela data e pelo predio
    where("(month(created_at) = ? and year(created_at) = ?) and predio = ? " , date, Time.now.year, predio).count()
  end



  def self.total_on(date) #def para o grafico de chamados total busca somente pela data
    where("date(created_at) = ?" , date).count

  end

end