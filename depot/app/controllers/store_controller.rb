class StoreController < ApplicationController
  def index
    @producs = Product.order(:title)
  end
end
