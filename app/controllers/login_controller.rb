class LoginController < ApplicationController

  def login
    @aviso = Aviso.find_by_sql("select * from avisos order by created_at DESC limit 1") # select feito no banco para trazer os avisos criados por ultimo

    if request.post?
      #@user = User.find_by_login_and_senha(params[:login], params[:senha])
      @user = User.find_by_login_and_senha(params[:login],Digest::SHA2.hexdigest("icb#{params[:senha]}")) #criptografia de senha
      if @user
        session[:user] = @user.id

        if session[:return_to]  && !session[:return_to].include?(url_for(:action => "login"))
          redirect_to session[:return_to]
          session[:return_to] = nil
        else
          redirect_to :controller => "chamados",:action => "index"
        end
      else
        session[:user] = nil
        cookies.delete(:auth_token)
        params[:login] = nil
        params[:senha] = nil
        flash[:notice] = "Login ou senha invalida."
      end
    end

  end

  def logout
    session[:user] = nil
    cookies.delete(:auth_token)

    redirect_to root_url
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
    #redirect_too :controller => "login" , :action => "login"
  end

end