class Api::V1::User::LensesController < ApplicationController

  def index
    @lenses = Lense.all
    render json: @lenses
  end

end
