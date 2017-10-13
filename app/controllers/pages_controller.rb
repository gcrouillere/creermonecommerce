class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :info, :google906057532e2dbb7e, :robots, :offerpresentation]
  layout 'offerpresentationlayout', :only => [:offerpresentation]

  def home
    @model_string = model_print
  end

  def confirmation
    @model_string = model_print
  end

  def info
    @model_string = model_print
  end

  def google906057532e2dbb7e
  end

  def robots
    respond_to :text
    render 'pages/robots.text.erb', public: true
  end

  def offerpresentation
  end

end
