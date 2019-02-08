# encoding: utf-8
class WelcomeController < ApplicationController

  def login
    s = Senhaunica.new('icb_oauth','6QCwxtVxNmdK4XvHp5XJ7SqznjwA7Ecq9VNzUpOW','2')
    redirect_to s.login()
  end

  def callback
    s = Senhaunica.new('icb_oauth','6QCwxtVxNmdK4XvHp5XJ7SqznjwA7Ecq9VNzUpOW','2')
    @data = s.callback(params[:oauth_verifier])

    print "Data = " +   @data.to_s

    loginUsuario = tratauser

    log_in loginUsuario

    carregaperfils

    addlog("Fez login no sistema")

    redirect_to chamados_path, notice: "Login feito com sucesso"



  end

  def tratauser

    loginUsuario = @data["loginUsuario"]

    userexiste = Usuario.where("loginUsuario = ?", loginUsuario)

    if userexiste.empty?
      user = Usuario.new
    else
      user = Usuario.find_by_loginUsuario(loginUsuario)
    end

    user.loginUsuario = loginUsuario
    user.nomeUsuario = @data["nomeUsuario"]
    user.tipoUsuario = @data["tipoUsuario"]
    user.emailPrincipalUsuario = @data["emailPrincipalUsuario"]
    user.emailAlternativoUsuario = @data["emailAlternativoUsuario"]
    user.emailUspUsuario = @data["emailUspUsuario"]
    user.numeroTelefoneFormatado = @data["numeroTelefoneFormatado"]
    user.ramalUsp = @data["ramalUsp"]

    user.save

    id = user.id

    @vinculo = @data["vinculo"]

    @vinculo.each do |v|

      vinculoexiste = TipoVinculo.where(:usuario_id => id, :tipoVinculo => v["tipoVinculo"])


      if vinculoexiste.empty?
        tipoVinc = TipoVinculo.new
      else
        #tipoVinc = TipoVinculo.find(:usuario_id => id, :tipoVinculo => v["tipoVinculo"] )
        tipoVinc = TipoVinculo.find_by_usuario_id_and_tipoVinculo(id,v["tipoVinculo"])
      end

      tipoVinc.codigoSetor = v["codigoSetor"]
      tipoVinc.nomeAbreviadSetor = v["nomeAbreviadSetor"]
      tipoVinc.nomeSetor = v["nomeSetor"]
      tipoVinc.codigoUnidade = v["codigoUnidade"]
      tipoVinc.siglaUnidade = v["siglaUnidade"]
      tipoVinc.nomeUnidade = v["nomeUnidade"]
      tipoVinc.nomeVinculo = v["nomeVinculo"]
      tipoVinc.nomeAbreviadoFuncao = v["nomeAbreviadoFuncao"]
      tipoVinc.tipoVinculo = v["tipoVinculo"]
      tipoVinc.usuario_id = id
      tipoVinc.save!
    end
    return loginUsuario
  end

  def destroy
    addlog("Saiu do sistema")
    log_out
    redirect_to root_path
  end

end