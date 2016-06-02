class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @producs = Product.order(:title)
  end
end
