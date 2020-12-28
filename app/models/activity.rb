class Activity < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :asset, presence: true
  validates :entry, presence: true
  validates :stoploss, presence: true
  validates :target_1, presence: true
  validates :target_2, presence: true
end
