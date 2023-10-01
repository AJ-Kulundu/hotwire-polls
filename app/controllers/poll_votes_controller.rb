class PollVotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_poll
    before_action :set_poll_item

    def create
        @poll_vote = @poll_item.poll_votes.build(poll_vote_params)

        if @poll_vote.save
            redirect_to poll_path(@poll), notice: "Your vote was successfully recorded."
        else
            redirect_to poll_path(@poll), alert: "Your vote was not recorded."
        end
    end


    private

    def poll_vote_params
        params.require(:poll_vote).permit(:vote).merge(user_id: @user.id)
    end

    def set_user
        @user = current_user
    end

    def set_poll
        @poll = Poll.find(params[:poll_id])
    end

    def set_poll_item
        @poll_item = PollItem.find(params[:poll_item_id])
    end

end
