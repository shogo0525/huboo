class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:participant][:event_id])
    ticket = Ticket.find(params[:participant][:ticket_id])
    current_user.participate!(event, ticket)
    redirect_to event_path(event), notice: "参加しました！"
  end

  def destroy
    event = Participant.find(params[:id]).event
    current_user.cancel!(event)
    redirect_to event_path(event), notice: "キャンセルしました！"
  end

  def kick_out
    participant = Participant.find(params[:id])
    participant.kicked_out_at = Time.current
    if participant.save
      flash[:notice] = '参加者を追い出しました'
    else
      flash[:notice] = '参加者を追いだせませんでした'
    end
    redirect_to event_path(participant.event)
  end
end
