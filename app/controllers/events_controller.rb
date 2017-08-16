class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]
  def index
    @events = Event.all
    @event = Event.new
    @event.tickets.build

    # sample for gon
    gon.user_name = current_user.try!(:name) || '名無しさん'
  end

  def show
  end

  def new
    @event = Event.new
    @event.tickets.build
    if event_id = params[:event_id]
      @copy = Event.find(event_id)
    end
  end

  def create
    @event = Event.new(events_params)
    if @event.save
      current_user.event_owners.create(event_id: @event.id)
      redirect_to root_path, notice: "イベントを作成しました！"
    else
      render :new
    end
  end


  def destroy
    if @event.destroy
      redirect_to root_path, notice: "イベントを削除しました！"
    else
      redirect_to root_path, notice: "イベントが削除できませんでした！"
    end
  end

  private
    def events_params
      params.require(:event).permit(
        :title, :description, :participant_public_flg,
        tickets_attributes: [:name, :price, :capacity]
    )
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
