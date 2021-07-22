class CoordinationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @coordinations = Coordination.all
  end

  def show
    @coordination = Coordination.find(params[:id])
  end

  def new
    @coordination = Coordination.new
  end

  def create
    @coordination = current_user.coordinations.build(coordination_params)
    if @coordination.save
      redirect_to coordination_path(@coordination), notice: "コーディネートを投稿しました。"
    else
      render :new
    end
  end

  def edit
    @coordination = Coordination.find(params[:id])
    if @coordination.user != current_user
      redirect_to coordinations_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @coordination = Coordination.find(params[:id])
    if @coordination.update(coordination_params)
      redirect_to coordination_path(@coordination), notice: "コーディネートを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    coordination = Coordination.find(params[:id])
    coordination.destroy
    redirect_to user_path(coordination.user), notice: "レシピを削除しました。"
  end


  private
  def coordination_params
    params.require(:coordination).permit(:image, :body, :comment)
  end
end
