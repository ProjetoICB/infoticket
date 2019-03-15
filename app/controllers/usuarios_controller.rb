# encoding: utf-8
class UsuariosController < ApplicationController


  def index
    @usuarios = Usuario.order('nomeUsuario')
    session[:avisa] = false
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end


  def show
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    addlog("Atualizando usuário")
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_url, notice: 'Usuário alterado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end
end