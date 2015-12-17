class ShoesController < ApplicationController
    before_filter :authenticate
    respond_to :html
    
    def index
      @shoes = Shoe.all
      respond_with(@shoes)
    end
    
    def create
        shoe = Shoe.new(shoe_params)
        shoe.user_id = current_user.id
        if shoe.save
            redirect_to '/'
        else
            flash[:errors] = shoe.errors.full_messages
            redirect_to '/dashboard'
        end 
    end
    
    def destroy
        Shoe.delete(params[:id])
        redirect_to '/dashboard'
    end
    
    def buy
        Shoe.update(params[:id], :status => 1, :buyer_id => current_user.id)
        redirect_to '/'
    end
    
    private
    def shoe_params
        params.require(:shoe).permit(:name, :price)
    end
end