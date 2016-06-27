class ListsController < ApplicationController
  skip_after_action :verify_authorized, only: [:index]

  def new
  end

  def create
    list = current_user.lists.new title: params[:title]
    authorize list
    list.save!
    redirect_to "/lists"
  end

  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find params[:id]
    authorize @list
  end

  def destroy
    list = List.find params[:id]
    authorize list
    list.destroy
    redirect_to "/lists"
  end
end
