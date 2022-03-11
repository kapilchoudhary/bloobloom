class Api::V1::Admin::FramesController < ApplicationController
   before_action :set_frame, only: [:update, :destroy]
    # POST /frames
    def create
        @frame = Frame.new(frame_params)

        if @frame.save
            render json: @frame, status: :created, location: @frame
        else
            render json: @frame.errors, status: :unprocessable_entity
        end
    end

        # PATCH/PUT /frames/1
    def update
        if @frame.update(frame_params)
            render json: @frame
        else
            render json: @frame.errors, status: :unprocessable_entity
        end
    end

        # DELETE /frames/1
    def destroy
        @frame.destroy
    end

    private
    def frame_params
        params.permit(:name, :description, :status, :stock, :price)
    end

    def set_frame
        @frame = Frame.find(params[:id])
    end
end
