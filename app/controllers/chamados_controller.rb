class ChamadosController < ApplicationController
  # GET /chamados
  # GET /chamados.json
require 'will_paginate/array'   #necessario para gem funcionar

 before_filter :usuario_autenticado?
=begin
def resumopp

  @chamados = Chamado.find(:all , :conditions => {:status => ["Em atendimento","Encaminhado"] })

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @chamados }
  end

end

def resumo

  @chamados = Chamado.find(:all , :conditions => {:status => ["Em atendimento","Aguardando atendimento","Encaminhado"] })

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @chamados }
  end

end

def relatorio
  @chamado = Chamado.find(:all)   # def para o funcionameto dos graficos
end

=end

def index
 @chamados = Chamado.order('id desc')




=begin

    @user = User.find(:first, :conditions => {:id => session[:user]})

    if @user.type_id == 1  #type_id iras servir para diferenciar usuarios de adms

      @chamados = Chamado.find(:all, :conditions => { :user_id => session[:user] })  # somente os chamados do usuario logado podera ser visto
      

    elsif @user.type_id == 0

      @chamados = Chamado.all       # o TECNICO poderah ver todos os chamados criados

    end

=end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chamados }
    end
end


  def indexOld
    @chamados = Chamado.order('id desc')
    @user = User.find(:first, :conditions => {:id => session[:user]})
    if @user.type_id == 1  #type_id iras servir para diferenciar usuarios de adms
      @chamados = Chamado.find(:all, :conditions => { :user_id => session[:user] })  # somente os chamados do usuario logado podera ser visto
    elsif @user.type_id == 0
      @chamados = Chamado.all       # o TECNICO poderah ver todos os chamados criados
    end
  end








  # GET /chamados/1
  # GET /chamados/1.json
  def show

    @chamado = Chamado.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chamado }
    end
  end

  # GET /chamados/new
  # GET /chamados/new.json
  def new

     @chamado = Chamado.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chamado }
    end
  end

  # GET /chamados/1/edit
  def edit
    @chamado = Chamado.find(params[:id])

  end

  # POST /chamados
  # POST /chamados.json
  def create

    @chamado = Chamado.new(params[:chamado])
   # @chamado.user_id = session[:user]    #preenche automaticamente o  campo user_id com o usuario logado
    @chamado.user_id = session[:login]

    respond_to do |format|
      if @chamado.save
          #corrigir essa linha de baixo
          #UserMailer.chamados_new(@chamado).deliver     # envia uma mensagem para o usuario que criou o chamado

        format.html { redirect_to @chamado, notice: 'Voce vai receber um email informando para qual tecnico foi encaminhado.' }
        format.json { render json: @chamado, status: :created, location: @chamado }
      else
        format.html { render action: "new" }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chamados/1
  # PUT /chamados/1.json
  def update

    @chamado = Chamado.find(params[:id])
    @users = User.all

    respond_to do |format|
      if @chamado.update_attributes(params[:chamado])
        if @chamado.tecnico == ""
          format.html { render action: "edit" }
          format.json { render json: @chamado.errors, status: :unprocessable_entity }
        else
          #UserMailer.chamados_update(@chamado).deliver #alterado 31/03/2015
          #UserMailer.chamados_atender(@chamado).deliver
            format.html { redirect_to @chamado, notice: 'Chamado foi atualizado com successo.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @chamado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chamados/1
  # DELETE /chamados/1.json


  def destroy                                   #esta def nao eh utilizada nesta aplicacao
    @chamado = Chamado.find(params[:id])
    @chamado.destroy

    respond_to do |format|
      format.html { redirect_to chamados_url }
      format.json { head :no_content }
    end
  end
end
