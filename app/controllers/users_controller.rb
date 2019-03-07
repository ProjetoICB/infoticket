class UsersController < ApplicationController
  # GET /users
  # GET /users.json
 require 'will_paginate/array'   # necessario para a gem will paginate funcionar


  def index
    #@users = User.all.paginate(:page => params[:page],:per_page => 20)   # ira mostrar a lista de usuarios 20 por pagina
   @users = User.all
   session[:avisa] = false
   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    #@user = User.new(params[:user])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(params[:user])
    @user.senha= Digest::SHA2.hexdigest("icb#{params[:user][:senha]}")           #esta linha foi incluida para fazer a criptografia
    @user.senha_confirmation= Digest::SHA2.hexdigest("icb#{params[:user][:senha_confirmation]}")   #esta linha foi incluida para fazer a criptografia

    respond_to do |format|
      if @user.save
        UserMailer.mensagem_boas_vindas(@user).deliver # envia um email de boas vindas para o novo usuario

        format.html { redirect_to @user, notice: 'Usuario foi criado com successo.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      #end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Usuario foi editado com successo.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy                          # esta def nao eh utilizada nesta aplicacao
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_path }
      format.json { head :no_content }
    end
  end
end

