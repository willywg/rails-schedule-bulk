
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
    validate :validate_dates_end_after_start

    # Callbacks
    after_save :bulk_schedules_from_days

    def bulk_schedules_from_days
      valid_week_days.each do |week_day, dates|
        times_to_day = days[week_day].uniq.reject(&:empty?) # Uniq ensure not repeted times, and don't accept empty
        
        times_to_day.each do |start_time|
          dates.each do |start_on|
            Schedule.create(start_on: start_on, start_time: start_time)
          end
        end
      end
    end

    private
      # Methods Validations
      def validate_dates_end_after_start
        return if start_at.blank? || end_at.blank?

        errors.add(:end_at, 'debe ser mayor a la fecha inicial') if end_at < start_at
      end

      # Private methods
      def valid_week_days
        # Gets dates grouped by week day number (0 to 6)
        week_days = (start_at..end_at).group_by(&:wday)
        # Convert keys to string to match with days hash keys
        week_days = Hash[week_days.keys.map(&:to_s).zip(week_days.values)]

        # Picks only selected days
        week_days.slice(*days.keys)
      end
  end
end
