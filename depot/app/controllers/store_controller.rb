class StoreController < ApplicationController
  def index
    @producs = Product.order(:title)
    @counter = increment_count
  end

  private
  def increment_count
    if session[:counter].nil?
      session[:counter] = 0
    end
    session[:counter] += 1
  end
end
