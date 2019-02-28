module WelcomeHelper

  #cria uma sessão
  def log_in(loginUsuario)
    session[:login] = loginUsuario

    puts "\n"
    puts "Session de login = "
    puts session[:login]
  end

  #destroi a sessão criada na def anterior
  def log_out
    session.destroy
    @current_user = nil
  end


  def current_user
    @current_user ||= Usuario.find_by_loginUsuario(session[:login])
  end


  def carregaperfils

   @perfilscadastrados = Permitido.where('usuario_id = ?', current_user.id)

    session[:perfil] ||= []

    @perfilscadastrados.each do |p|
      session[:perfil] << p.perfil.tipo
      puts "Session de perfil = "
      puts session[:perfil]

    end
  end

end