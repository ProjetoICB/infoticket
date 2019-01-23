class SenhaResetsController < ApplicationController
  def create
  user = User.find_by_email(params[:email]) # instrucoes para a alteracao de senha serah enviada para o email que passado com parametro
  user.send_senha_reset if user
  redirect_to root_url, :notice => "Email enviado com  instrucoes para a renovacao de senha."
end

def edit
  @user = User.find_by_senha_reset_token!(params[:id])   # def responsavel para criacao da nova senha o token gerado serah passado junto com o link para renovacao de senha
end

def update
=begin
  @user = User.find_by_senha_reset_token!(params[:id])

  if @user.senha_reset_sent_at < 2.hours.ago   # se em duas horas a senha nao for alterada a antiga permanecerah
    redirect_to new_senha_reset_path, :alert => "Senha resetada esta expirada."
  elsif @user.update_attributes(params[:user])
    redirect_to root_url, :notice => "Senha foi alterada!"
  else
    render :edit
  end
=end

  @user = User.find_by_senha_reset_token!(params[:id])

  if @user.senha_reset_sent_at < 2.hours.ago   # se em duas horas a senha nao for alterada a antiga permanecerah
    redirect_to new_senha_reset_path, :alert => "Senha resetada esta expirada."
  else
    user = User.find_by_senha_reset_token!(params[:id])
    user.criptografa_senha(params[:user][:senha])
    redirect_to root_url, :notice => "Senha foi alterada!"
  end

end
end
