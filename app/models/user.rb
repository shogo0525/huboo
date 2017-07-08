class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants, dependent: :destroy
  has_many :events, through: :participants

  def participate!(event)
    participants.create!(event_id: event.id)
  end
end
