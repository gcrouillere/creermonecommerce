class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :info, :google906057532e2dbb7e, :robots, :offerpresentation, :product_claim_details]
  layout 'offerpresentationlayout', :only => [:offerpresentation, :product_claim_details]

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

  def product_claim_details
  end

  def robots
    respond_to :text
    render 'pages/robots.text.erb', public: true
  end

  def offerpresentation
  end

end
