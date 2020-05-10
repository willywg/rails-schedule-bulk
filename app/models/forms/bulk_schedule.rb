
module Forms
  class BulkSchedule < ActiveType::Object
    # Attributes
    attribute :start_at, :date
    attribute :end_at, :date
    attribute :days

    # Validations
    validates :start_at, :end_at,  presence: true
  end
end
