class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy]
  def index
    @events = Event.all
    @event = Event.new
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)
    if @event.save
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
      params.require(:event).permit(:title, :description)
    end
    def set_event
      @event = Event.find(params[:id])
    end
end
