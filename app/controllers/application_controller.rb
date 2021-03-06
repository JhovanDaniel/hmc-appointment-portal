class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
      admin_panel_path
    end
    
    protected

      def configure_permitted_parameters
           devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :access_level, :location_id)}

           devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :access_level, :location_id)}
      end
    
end
