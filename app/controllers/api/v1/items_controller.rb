class Api::V1::ItemsController < ApplicationController
  def show
    render json: Item.find(params[:id])
  end

  def index
    render json: Item.all
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def destroy
    render json: Item.destroy(params[:id]), status: 204
  end

  private
    def item_params
      params.require(:params).permit(:name, :description, :image_url)
    end
end
