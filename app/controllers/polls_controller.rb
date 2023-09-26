class PollsController < ApplicationController
    before_action :set_user, except: [:index, :show]
    before_action :set_poll, only: [:show, :edit, :update, :destroy]
    def index
        @polls = Poll.all
    end
    
    def show
    end
    
    def new
        @polls = @user.polls.build
    end
    
    def create
        @polls = @user.polls.build(poll_params)
    
        if @polls.save
            redirect_to polls_path
        else
            render :new
        end
    end

    def edit; end
    
    private
    
    def poll_params
        params.require(:poll).permit(:name,:description)
    end

    def set_poll
        @poll = Poll.find(params[:id])
    end

    def set_user
        @user = current_user
    end
end
