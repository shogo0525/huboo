class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:participant][:event_id])
    current_user.participate!(@event)
    redirect_to root_path, notice: "参加しました！"
  end

  def destroy
    @event = Participant.find(params[:id]).event
    current_user.cancel!(@event)
    redirect_to root_path, notice: "キャンセルしました！"
  end
end
