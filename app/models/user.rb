class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants, dependent: :destroy
  has_many :event_owners, dependent: :destroy
  has_many :events, through: :participants
  has_many :own_events, through: :event_owners, source: :event

  def participate!(event, ticket, comment)
    participant = participants.find_or_initialize_by(event_id: event.id, ticket_id: ticket.id)
    participant.comment = comment
    participant.canceled_at = nil
    participant.save!
  end

  def participated?(event)
    participant = participants.find_by(event_id: event.id)
    participant.present? && !participant.canceled_at?
  end

  def cancel!(event)
    participant = participants.find_by(event_id: event.id)
    participant.canceled_at = Time.current
    participant.save!
  end

  def owner?(event)
    event_owners.find_by(event_id: event.id)
  end
end
