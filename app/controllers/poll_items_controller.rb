class PollItemsController < ApplicationController
    before_action :set_poll, only: [:edit, :update, :destroy]
    before_action :set_poll_item, only: [:edit, :update, :destroy]

    def edit;end

    def update
        if @poll_item.update(poll_item_params)
            respond_to do |format|
                format.html {redirect_to polls_path}
                format.turbo_stream
            end
        else
            render :edit,status: :unprocessable_entity
        end
    end

    def destroy
        @poll_item.destroy
        respond_to do |format|
            format.html {redirect_to polls_path}
            format.turbo_stream
        end
    end

    private
    def poll_item_params
        params.require(:poll_item).permit(:item_name)
    end

    def set_poll
        @poll = Poll.find(params[:poll_id])
    end

    def set_poll_item
        @poll_item = @poll.poll_items.find(params[:id])
    end
end
