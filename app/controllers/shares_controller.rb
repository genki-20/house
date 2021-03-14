class SharesController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @shares = Share.all.order(id: 'ASC')
  end

  def show
  end

  def new
    @share = Share.new
  end

  def create
    @share = Share.new(share_params)
    if @share.valid?
      @share.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless @item.buy.nil?
      redirect_to unless current_user.id == @item.user_idroot_path
    end
  end

  def update
    if @share.update(share_params)
      redirect_to share_path
    else
      render :edit
    end
  end

  def destroy
    @share.destroy if current_user.id == @share.user.id
    redirect_to root_path
  end

  private

  def share_params
    params.require(:share).permit(:product_name, :explanatory_name, :price, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @share = Share.find(params[:id])
  end

end
