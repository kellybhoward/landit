class WelcomeController < ApplicationController
  def index
      if session[:id]
          redirect_to '/dashboard'
      end
  end
end
