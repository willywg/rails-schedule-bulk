class Schedule < ApplicationRecord
  include WeekdaysHelper
  
  # Validations
  validates :start_on, :start_time,  presence: true
  validates :start_time, uniqueness: { scope: :start_on } # Schedule should be uniq by start_on and start_time

  # Custom Validations
  validates :start_on, not_in_past: true # See: app/models/validators/not_in_past_validator.rb

  # Custom Methods
  def start_time_str
    start_time.strftime("%H:%M")
  end

  def weekday
    weekdays[start_on.wday.to_s]
  end
end
