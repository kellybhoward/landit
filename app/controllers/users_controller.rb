class UsersController < ApplicationController
    before_action :require_login, except: [:new, :old, :create, :login]
    def new
        #   register page
    end

    def old
        if session[:id]
            session[:id] = nil
        end
        #  login page
    end

    def login
        print params
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id
            redirect_to "/dashboard"
        else
            flash[:error] = "Email/password don't match"
            redirect_to '/login'
        end
    end

    def logout
        session[:id] = nil
        redirect_to '/'
    end

    def create
        @user = User.create(user_params)
        if @user.errors.any?
            flash[:error] = "Invalid Registration"
            redirect_to '/create-account'
        else
            session[:id] = @user.id
            redirect_to "/dashboard"
        end
    end

    def show
        @user = User.find(session[:id])
    end

    def edit
        @user = User.find(session[:id])
    end

    def update
        update_user
    end

    def destroy
        User.find(session[:id]).destroy
        session[:id] = nil
        redirect_to '/'
    end
    private
        def user_params
            params.require(:user).permit("first_name", "last_name", "email", "password", "password_confirmation")
        end
        def update_user
            @user = User.find(session[:id])
            @user.update_attribute(:first_name, params[:first_name])
            @user.update_attribute(:last_name, params[:last_name])
            @user.update_attribute(:email, params[:email])
            if !@user
                flash[:error] = "Invalid Edit - Please Try Again"
                redirect_to "/update-account"
            else
                redirect_to "/dashboard"
            end
        end
end
