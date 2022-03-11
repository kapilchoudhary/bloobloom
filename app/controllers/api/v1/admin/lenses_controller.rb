class Api::V1::Admin::LensesController < ApplicationController
    before_action :set_lense, only: [:update, :destroy]
    before_action :authorize_user, only: [:create, :update, :destroy]


    def create
      if @current_user.admin?
          @lense = Lense.new(lense_params)
      
          if @lense.save
            render json: @lense, status: :created
          else
            render json: @lense.errors, status: :unprocessable_entity
          end
        else
          render json: {errors: "Unauthoroized access"}
      end
    end
    
      # PATCH/PUT /lenses/1
    def update
      if @current_user.admin?
          if @lense.update(lense_params)
            render json: @lense
          else
            render json: @lense.errors, status: :unprocessable_entity
          end
      else
          render json: {errors: "Unauthoroized access"}
      end
    end
    
      # DELETE /lenses/1
    def destroy
      if @current_user.admin?
           @lense.destroy
      else
            render json: {errors: "Unauthoroized access"}
      end
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
