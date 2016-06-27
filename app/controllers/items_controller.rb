class ItemsController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @item = @list.items.new
    authorize @item
  end

  def create
    @item = @list.items.new approved_params
    authorize @item
    if @item.save
      flash[:notice] = "Item created!"
      redirect_to @list
    else
      render :new
    end
  end

  def edit
    @item = Item.find params[:id]
    authorize @item
  end

  def update
    @item = Item.find params[:id]
    authorize @item
    if @item.update approved_params
      flash[:notice] = "Item updated!"
      redirect_to @item.list
    else
      render :edit
    end
  end

  private

  def set_list
    @list = List.find params[:list_id]
  end

  def approved_params
    params.require(:item).permit(:description, :due_date)
  end
end
