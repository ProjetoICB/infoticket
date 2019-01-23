class User < ActiveRecord::Base
  attr_accessible :departamento, :email, :login, :nome, :ramal, :senha, :senha_confirmation, :senha_reset_token, :senha_reset_sent_at,
      :type_id, :type, :sobrenome , :tecnico, :n_usp

  before_create { generate_token(:auth_token) }
  #before_save :criptografa_senha

  validates_confirmation_of :senha   ,:message => 'e a confirmacao nao conferem'
  validates_presence_of :senha  , :message => 'precisa ser preenchida'
  validates_length_of :senha, :minimum => 5 , :message =>  'precisa ter no minimo 5 digitos'
  validates_presence_of :sobrenome ,:message => 'em branco'
  validates_presence_of   :nome      ,:message => 'em branco'
  validates_presence_of   :login     ,:message =>'em branco'
  validates_presence_of :email       ,:message => 'em branco'
  validates_uniqueness_of :email    ,:message  => 'ja cadastrado'
  validates_uniqueness_of :login    ,:message  => 'ja cadastrado'

 has_many :chamados
 has_many :comentarios, :through => :user_id

def send_senha_reset                     #def para alteracao de senha
  generate_token(:senha_reset_token)     # traz o token gerado
  self.senha_reset_sent_at = Time.zone.now
  save!
  UserMailer.senha_reset(self).deliver  # envia uma mensagem ao usuario com instrucoes para alteracao de senha
end

def generate_token(column)               # def gera um token randomico para ser passado como parametro
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

=begin
def criptografa_senha
  self.senha = Digest::SHA256.hexdigest("icb#{senha}")    # criptografa a senha criada
end
=end

def criptografa_senha(senhanova)
  self.senha = Digest::SHA256.hexdigest("icb#{senhanova}")    # criptografa a senha criada
  save!
end

end
