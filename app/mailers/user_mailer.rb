
class UserMailer < ActionMailer::Base
  default :from => "naoresponder@icb.usp.br"  

  def mensagem_boas_vindas(user)      # usuario recebera uma mensagem com nome e login que foram cadastrados
    @user = user
    @site = "http://watson.icb.usp.br/infoticket"
    mail(:to => user.email,:subject => "Infoticket - Seja bem-vindo ao sistema de chamados")
  end

  def senha_reset(user)             # usuario recebera uma mensagem com as instrucoes para alterar senha
    @user = user
    mail :to => user.email, :subject => "Infoticket "
  end

  def chamados_update(chamado)    # a cada alteracao no chamado feita pelo tecnico o usuario recebera uma mensagem
    @chamado = chamado
    if @chamado.id < 1253
      mail(:to => chamado.user.email,:subject => "Infoticket - Alteracao de status")
    else
      mail(:to => chamado.usuario.emailPrincipalUsuario, :subject => "Alteracao de status")
    end
  end

  def chamados_new(chamado)      # usuario recebera uma mensagem de confirmacao
     @chamado = chamado
     mail(:to => chamado.user.email,:subject => "Infoticket - Novo chamado")
  end


  def respcomentario(chamado)
    @chamado = chamado
    if @chamado.id < 1253
      mail(:to => chamado.user.email, :subject => "Comentario do tecnico")
    else
      mail(:to => chamado.usuario.emailPrincipalUsuario, :subject => "Comentario do tecnico")
    end
  end


  def chamados_atender(chamado)

    @chamado = chamado

    if chamado.tecnico == 'Charles'
      mail(:to => "charles@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Fabiana'
      mail(:to => "farodrigues@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Daniel'
      mail(:to =>"dpassarini@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Sidnei'
      mail(:to =>"sidnei@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Edson'
      mail(:to =>"edsonx@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Gerardo'
      mail(:to =>"sidnei@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Marilene'
      mail(:to =>"marilene@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    elsif chamado.tecnico == 'Cesar'
      mail(:to =>"cesarps@icb.usp.br",:subject => "Infoticket - Chamado para atender")
    end

  end

end
