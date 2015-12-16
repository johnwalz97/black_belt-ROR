class ShoesController < ApplicationController
    before_filter :authenticate
    def index
      @shoes = Shoe.all
      respond_with(@groups)
    end
end