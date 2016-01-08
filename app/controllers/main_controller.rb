class MainController < ApplicationController
    def index
        if session[:id] == nil
            redirect_to '/welcome'
        else
            redirect_to '/dashboard'
        end
    end
    def cover_letter
    end
    def salaries
    end
end
