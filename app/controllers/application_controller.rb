class ApplicationController < ActionController::Base
  # DEVISE :
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource
  after_action :store_location

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  #DEVISE methods:

  # 0 - Layout for devise
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

    # 1 - Rendering current page after sign-in/up
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  # 2 - Permitted parameters for sign_in/up
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :productphoto,
      :productphotomobile,
      :productphotomobile,
      :lessonphoto,
      :avatarphoto,
      :cityphoto,
      :logophoto,
    ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :productphoto,
      :productphotomobile,
      :productphotomobile,
      :lessonphoto,
      :avatarphoto,
      :cityphoto,
      :logophoto,
    ])
  end

  # META-TAG-FB_TWITTER
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end


