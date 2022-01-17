class LocationsController < ApplicationController
    
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    def new
        @location = Location.new
    end
    
    def create
      @location = Location.new(location_params)
      if @location.save
          flash[:notice] = "The location has been created"
          redirect_to locations_path
      else
         render 'new' 
      end
  end 

    def index
        @locations = Location.all
    end

    def edit 
    
    end
    
    def update
        if @location.update(location_params)
            flash[:notice] = "Location was updated successfully"
            redirect_to @location
        else
            render 'edit'
        end
    end
    
    def show
    
    end
    
    def destroy 
        @location.destroy
        flash[:notice] = "Location was deleted successfully"
        redirect_to locations_path
    end

    private
    
    def set_location
      @location = Location.find(params[:id])
    end
    
    def location_params
       params.require(:location).permit(:name, :location, :email) 
    end

end