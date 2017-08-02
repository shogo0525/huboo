class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants, dependent: :destroy
  has_many :event_owners, dependent: :destroy
  has_many :events, through: :participants
  has_many :own_events, through: :event_owners, source: :event

  def participate!(event)
    participants.create!(event_id: event.id)
  end

  def participated?(event)
    participants.find_by(event_id: event.id)
  end

  def cancel!(event)
    participants.find_by(event_id: event.id).destroy
  end

  def owner?(event)
    event_owners.find_by(event_id: event.id)
  end
end
