class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
#      pay_item
#      @purchase.save
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def address_params
    params.require(:purchase_address).permit(:post_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

#  def pay_item
#    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
#    Payjp::Charge.create(
#      amount: @item.price,
#      card: purchase_params[:token],
#      currency:'jpy'
#    )
# end

end
