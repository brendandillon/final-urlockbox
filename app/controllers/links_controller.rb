class LinksController < ApplicationController
  before_action :authenticate

  def authenticate
    redirect_to '/landing' unless current_user
  end

  def index
    @hot_links = Link.hot
  end
end
