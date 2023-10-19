class PollVotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_poll
    before_action :set_poll_item

    def create
        @poll_vote = @poll_item.poll_votes.build(user: @user)

        if @poll_vote.save
            respond_to do |format|
                format.html {redirect_to poll_path(@poll), flash: "Your vote was successfully recorded."}
                format.turbo_stream
            end
        else
            redirect_to poll_path(@poll), flash: "Your vote was not recorded."
        end
    end


    private

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
