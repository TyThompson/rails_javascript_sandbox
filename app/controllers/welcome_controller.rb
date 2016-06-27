class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @username = "World"
  end

  def super_secret
  end
end
