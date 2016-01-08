class Phone < ActiveRecord::Base
  belongs_to :manufacturer

  validates :manufacturer, presence: true
  validates :year, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 2003 }
  validates :battery_life, presence: true
  validates :battery_life, numericality: { only_integer: true }
end
