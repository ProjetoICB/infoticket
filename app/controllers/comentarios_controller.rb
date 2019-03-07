class ComentariosController < ApplicationController

  def index
    @comentarios = Comentario.order("chamado_id desc")
    session[:avisa] = false
    respond_to do |format|
      format.html
      format.json { render json:  @chamados}
    end
  end


  def create          # esta def estah vinculada diretamente ao chamado e as views upate e show
    @chamado = Chamado.find(params[:chamado_id])
    @comentario = @chamado.comentarios.create(params[:comentario])
    @comentario.user_id = session[:user]
    @comentario.usuario_id = current_user.id
    @comentario.save
    if @comentario.respPorEmail == true
      UserMailer.respcomentario(@chamado).deliver
    end
       UserMailer.chamados_update(@chamado).deliver # usuario receberah uma mensagem quando o status do chamado for alterado
    redirect_to chamado_path(@chamado)
  end

  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end


   def destroy         # esta def nao eh utilizada nesta aplicacao
    @chamado = Chamado.find(params[:chamado_id])
    @comentario = @chamado.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to chamado_path(@chamado)
  end
end