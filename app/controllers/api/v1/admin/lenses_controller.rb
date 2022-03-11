class Api::V1::Admin::LensesController < ApplicationController
    before_action :set_lense, only: [:update, :destroy]
    def create
        @lense = Lense.new(lense_params)
    
        if @lense.save
          render json: @lense, status: :created, location: @lense
        else
          render json: @lense.errors, status: :unprocessable_entity
        end
    end
    
      # PATCH/PUT /lenses/1
    def update
        if @lense.update(lense_params)
          render json: @lense
        else
          render json: @lense.errors, status: :unprocessable_entity
        end
    end
    
      # DELETE /lenses/1
    def destroy
        @lense.destroy
    end
    
private
    # Use callbacks to share common setup or constraints between actions.
    def set_lense
        @lense = Lense.find(params[:id])
    end
    

    def lense_params
      params.permit(:color, :prescription_type, :description, :lens_type, :stock, :price)
    end
   
end
