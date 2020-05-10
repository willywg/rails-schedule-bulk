
module Forms
  class BulkSchedule < ActiveType::Object
    # Attributes
    attribute :start_at, :date
    attribute :end_at, :date
    attribute :days

    # Validations
    validates :start_at, :end_at,  presence: true

    # Custom Validations
    # See: app/models/validators/not_in_past_validator.rb
    validates :start_at, not_in_past: true 
    validates :end_at, not_in_past: true 
  end
end
