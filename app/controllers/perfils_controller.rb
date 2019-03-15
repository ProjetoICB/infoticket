# encoding: utf-8
class PerfilsController < ApplicationController

  before_filter :usuario_autenticado?

  # GET /perfils
  # GET /perfils.json
  def index
    @perfils = Perfil.all
    session[:avisa] = false
  end

  # GET /perfils/1
  # GET /perfils/1.json
  def show
    @perfil = Perfil.find(params[:id])
  end

  # GET /perfils/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
  end

  # POST /perfils
  # POST /perfils.json
  def create
    @perfil = Perfil.new(params[:perfil])

    respond_to do |format|
      if @perfil.save
         addlog("Criou um novo perfil")
        format.html { redirect_to @perfil, notice: 'Perfil foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1
  # PATCH/PUT /perfils/1.json
  def update
    @perfil = Perfil.find(params[:id])
    respond_to do |format|
      if @perfil.update_attributes(params[:perfil])
         addlog("Atualizou um perfil")
        format.html { redirect_to @perfil, notice: 'Perfil foi atualizado com sucesso' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end
end
