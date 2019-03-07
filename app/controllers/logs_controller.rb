# encoding: utf-8
class LogsController < ApplicationController

  before_filter :usuario_autenticado?

  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.order('id desc')
    session[:avisa] = false
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @log = Log.find(params[:id])
  end
end
