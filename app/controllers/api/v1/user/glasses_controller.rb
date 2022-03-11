class Api::V1::User::GlassesController < ApplicationController
  before_action :authorize_user
  before_action :set_frame, :set_lense, only: [:create]
  
  def create
    if @frame.stock > 0 && @lense.stock > 0
      @glass = Glass.new(glass_params)
      @glass.price = set_custom_glass_price
      if @glass.save
        reduce_stock_count
        render json: @glass
      else
        render json: { errors: @glass.errors.full_messages }, status: :unprocessable_entity
      end
    else
        if out_of_stock?(@frame)
          render json: { errors: "The selected frame is out of Stock" }
        elsif out_of_stock?(@lense)
          render json: { errors: "The selected lense pair is out of Stock" }
        end
    end
  end
 

  private

  def set_custom_glass_price
    @glass_price =  @frame.price + @lense.price 
    @price = Concurrency.convert(@glass_price, "USD", @current_user.currency)
  end  

  def reduce_stock_count
    @frame = Frame.find_by(id: @glass.frame_id).decrement(:stock)
    @lense = Lense.find_by(id: @glass.lense_id).decrement(:stock)
    @frame.save
    @lense.save
  end  

  def set_frame
    @frame = Frame.find(params[:frame_id])
  end

  def set_lense
    @lense = Lense.find(params[:lense_id])
  end  

  def glass_params
    params.permit(:frame_id, :lense_id, :price)
  end

  def out_of_stock?(item)
    item.stock == 0
  end

  def glass_params
      params.permit(:lense_id, :frame_id)
  end

end
      
    