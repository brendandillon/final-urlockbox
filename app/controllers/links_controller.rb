class LinksController < ApplicationController
  before_action :authenticate

  def authenticate
    redirect_to '/landing' unless current_user
  end

  def index
  end
end
