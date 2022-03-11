class Api::V1::Admin::FramesController < ApplicationController
   before_action :set_frame, only: [:update, :destroy]
   before_action :authorize_user, only: [:create, :update, :destroy]
    # POST /frames

    def create
        if @current_user.admin?
            @frame = Frame.new(frame_params)

            if @frame.save
                render json: @frame, status: :created
            else
                render json: @frame.errors, status: :unprocessable_entity
            end
        else
            render json: {errors: "Unauthorized access"}
        end
    end

        # PATCH/PUT /frames/1
    def update
        if @current_user.admin?
            if @frame.update(frame_params)
                render json: @frame
            else
                render json: @frame.errors, status: :unprocessable_entity
            end
        else
            render json: {errors: "Unauthorized access"}
        end
    end

        # DELETE /frames/1
    def destroy
        if @current_user.admin?
           @frame.destroy
        else
            render json: {errors: "Unauthorized access"}
        end
    end

    private

    def frame_params
        params.permit(:name, :description, :status, :stock, :price)
    end

    def set_frame
        @frame = Frame.find(params[:id])
    end

end
