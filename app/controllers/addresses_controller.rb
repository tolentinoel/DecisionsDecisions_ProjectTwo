class AddressesController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :get_address, only: [:show, :edit, :update, :destroy]
  
    def new
        @address = Address.new
    end
    
    def create
        @address = Address.new(address_params)
        if @address.save
            current_user.update_attribute(:address, @address)
            redirect_to user_path(current_user)
            flash[:success] = "Address successfully added."
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @address && @address.update(address_params)
            current_user.update_attribute(:address, @address)
            redirect_to user_path(current_user)
            flash[:success] = "Address successfully updated."
        else
            render 'edit'
        end
    end

    private

    def get_address
        @address = Address.find(params[:id])
    end

    def address_params
        params.require(:address).permit(:street_name, :city, :state, :zipcode, :country)
    end

end
