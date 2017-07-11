class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :tickets, allow_destroy: true
end
