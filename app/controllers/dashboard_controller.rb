class DashboardController < ApplicationController
    before_filter :authenticate
    respond_to :html
    
    def index
        @shoes = Shoe.all
        respond_with(@shoes)
    end

end