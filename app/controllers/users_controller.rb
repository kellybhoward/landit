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
        elsif params[:email] == ""
            redirect_to '/login'
        elsif @user.nil?
            flash[:error] = "That user doesn't exist"
            redirect_to '/login'
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
        if params[:user][:first_name] == "" || params[:user][:last_name] == "" || params[:user][:email] == ""
            flash[:error] = ["You must fill out the entire form"]
            redirect_to '/create-account'
            return
        end
        @user = User.create(user_params)
        if @user.errors.any?
            flash[:error] = @user.errors.full_messages
            redirect_to '/create-account'
        else
            session[:id] = @user.id
            redirect_to "/dashboard"
        end
    end

    def show
        @user = User.find(session[:id])
    end

    def show_job
        if correct_user_for_job
            @user = User.find(session[:id])
            @job = User.find(session[:id]).jobs.find(params[:id])
        else
            redirect_to '/'
        end
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
