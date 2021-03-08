class SharesController < ApplicationController
  def index
    @shares = Share.all.order(id: 'ASC')
  end

  def show
    @share = Share.find(params[:id])
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

  private

  def share_params
    params.require(:share).permit(:product_name, :explanatory_name, :price, :images).merge(user_id: current_user.id)
  end

end
