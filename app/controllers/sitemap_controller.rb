class SitemapController < ApplicationController
  layout nil
  skip_before_action :authenticate_user!, only: [:sitemap]

  def sitemap
  end
end
