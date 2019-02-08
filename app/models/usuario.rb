class Usuario < ActiveRecord::Base

  attr_accessible :loginUsuario, :nomeUsuario, :tipoUsuario, :emailPrincipalUsuario, :emailAlternativoUsuario, :emailUspUsuario, :numeroTelefoneFormatado, :ramalUsp

  has_many :chamados
  has_many :comentarios,  dependent: :destroy
  has_many :tipo_vinculos, dependent: :destroy
  has_many :logs, :dependent => :destroy
  has_many :permitidos
  has_many :perfils, through: :permitidos

















=begin
  has_secure_password

  def self.authenticate(email, password)

    find_by(login: email).
        try(:authenticate, password)

  end

=end

end
