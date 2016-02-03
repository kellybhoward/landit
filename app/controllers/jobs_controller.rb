class JobsController < ApplicationController
    before_action :require_login
    def new
        @states = State.order('state_name ASC')
    end

    def create
        # get state and user
        print params
        if params[:state]
            @state = State.find(params[:state])
        end
        @user = User.find(session[:id])
        # check if the application url is unique, if not, send error message
        @user.jobs.each do |job|
            if job.application_url == params[:application_url]
                flash[:error] = "You have already added a job with that application."
                redirect_to '/add-job'
                return
            end
        end
        @job = Job.create(company_name:params[:company_name], company_url:params[:company_url], position:params[:position], application_url:params[:application_url], city:params[:city], state:@state, user:@user)
        if @job.errors.any?
            flash[:error] = "Please include an application URL"
            redirect_to '/add-job'
        else
            redirect_to "/dashboard"
        end
    end

    def edit
        @states = State.order('state_name ASC')
        if correct_user_for_job
            @job = Job.find(params[:id])
        else
            redirect_to "/"
        end
    end

    def update_research
        update_research_job
        after_update
    end

    def update_progress
        update_progress_job
        after_update
    end

    def update_offer
        update_offer_job
        after_update
    end

    def update_info
        update_info_job
        if !@job
            flash[:error] = "Invalid Update - Please Try Again"
            redirect_to "/jobs/#{params[:id]}/edit"
        else
            redirect_to "/job-details/#{params[:id]}"
        end
    end

    def update_reject
        update_rejected_job
    end

    def update_archive
        update_archive_job
    end

    def destroy
        Job.find(params[:id]).destroy
        redirect_to '/'
    end
    def get_job
        @job = Job.find(params[:id])
    end
    private
    before_action :get_job, except: [:new, :create]
        def update_progress_job
            if params[:write_cv]
                @job.update_attribute(:write_cv, params[:write_cv])
            else
                @job.update_attribute(:write_cv, false)
            end
            if params[:review_resume]
                @job.update_attribute(:review_resume, params[:review_resume])
            else
                @job.update_attribute(:review_resume, false)
            end
            if params[:apply]
                @job.update_attribute(:apply, params[:apply])
            else
                @job.update_attribute(:apply, false)
            end
            @job.update_attribute(:apply_time, params[:apply_time]) if params[:apply_time]
            if params[:confirmation]
                @job.update_attribute(:confirmation, params[:confirmation])
            else
                @job.update_attribute(:confirmation, false)
            end
            if params[:interview]
                @job.update_attribute(:interview, params[:interview])
            else
                @job.update_attribute(:interview, false)
            end
            @job.update_attribute(:interview_date, params[:interview_date]) if params[:interview_date]
            @job.update_attribute(:interview_notes, params[:interview_notes]) if params[:interview_notes]
        end

        def update_offer_job
            @job.update_attribute(:offer_notes, params[:offer_notes]) if params[:offer_notes]
            @job.update_attribute(:salary, params[:salary]) if params[:salary]
            @job.update_attribute(:start_date, params[:start_date]) if params[:start_date]
            if params[:offer]
                @job.update_attribute(:offer, params[:offer])
            else
                @job.update_attribute(:offer, false)
            end
            if params[:accept]
                @job.update_attribute(:accept, params[:accept])
            else
                @job.update_attribute(:accept, false)
            end
        end

        def update_research_job
            @job.update_attribute(:mission, params[:mission]) if params[:mission]
            @job.update_attribute(:notes, params[:notes]) if params[:notes]
            @job.update_attribute(:est_salary, params[:est_salary]) if params[:est_salary]
        end

        def update_rejected_job
            @job.update_attribute(:accept, false)
            redirect_to '/dashboard'
        end

        def update_archive_job
            if @job.archived == true
                @job.update_attribute(:archived, false)
            elsif @job.archived == false
                @job.update_attribute(:archived, true)
            end
            redirect_to '/dashboard'
        end

        def update_info_job
            @job.update_attribute(:company_name, params[:company_name])
            @job.update_attribute(:company_url, params[:company_url])
            @job.update_attribute(:position, params[:position])
            @job.update_attribute(:application_url, params[:application_url])
            @job.update_attribute(:city, params[:city])
            if params[:state]
                @state = State.find(params[:state])
            end
            @job.update_attribute(:state, @state)
        end

        def after_update
            if !@job
                flash[:error] = "Invalid Update - Please Try Again"
            end
            redirect_to "/job-details/#{@job.id}"
        end
end
