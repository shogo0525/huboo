class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
end
