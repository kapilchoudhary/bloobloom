class GlassesController < ApplicationController
  #before_action :authorize_request
  before_action :set_frame, :set_lense, only: [:create]
  

  def create
    if @frame.stock > 0 && @lense.stock > 0
      @price = set_custom_glass_price
      @custom_glass = Glass.create(lense_id: params[:lense_id].to_i, frame_id: params[:frame_id].to_i, price: @price)
      
      if @custom_glass.save
        reduce_stock_count
        render json: @custom_glass
      else
        render json: { errors: @custom_glass.errors.full_messages }
      end
    
    else
        if @frame.stock == 0
          render json: { errors: "The selected frame is Out of Stock" }
        elsif @lense.stock == 0
          render json: { errors: "The selected lense pair is Out of Stock" }
        end
    end
  end  

  private

  def set_custom_glass_price
    @glass_price =  @frame.price + @lense.price 
    @price = Concurrency.convert(@glass_price, "USD", "USD")
  end  

  def reduce_stock_count
    @frame = Frame.find_by(id: @custom_glass.frame_id).decrement(:stock)
    @lense = Lense.find_by(id: @custom_glass.lense_id).decrement(:stock)
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


end

