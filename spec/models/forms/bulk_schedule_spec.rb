require 'rails_helper'

RSpec.describe Forms::BulkSchedule, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end
end
