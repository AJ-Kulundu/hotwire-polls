class PollsController < ApplicationController
    before_action :set_user, except: [:index, :show]
    before_action :set_poll, only: [:show, :edit, :update, :destroy]
    def index
        @polls = Poll.all
    end
    
    def show
    end
    
    def new
        @polls = @user.polls.build(poll_params)
        @polls.poll_items.build if @polls.poll_items.blank?
    end
    
    def create
        @polls = @user.polls.build(poll_params)
    
        if @polls.save
            redirect_to polls_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @polls = @user.polls.build(poll_params)
    end

    def update
        if @poll.update(poll_params)
            redirect_to polls_path
        else
            render :edit,status: :unprocessable_entity
        end
    end
    
    private
    
    def poll_params
        params.fetch(:poll,{}).permit(:name,:description,poll_items_attributes: [:item_name,:_destroy,:poll_id])
    end

    def set_poll
        @poll = Poll.find(params[:id])
    end

    def set_user
        @user = current_user
    end
end
