class Api::V1::User::FramesController < ApplicationController
    
    def index
        @frames = Frame.where(status: :active)
        render json: @frames
    end 
  
end
