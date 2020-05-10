class Schedule < ApplicationRecord
  # Validations
  validates :start_on, :start_time,  presence: true
  validates :start_time, uniqueness: { scope: :start_on } # Schedule should be uniq by start_on and start_time

  # Custom Validations
  validates :start_on, not_in_past: true # See: app/models/validators/not_in_past_validator.rb
end
