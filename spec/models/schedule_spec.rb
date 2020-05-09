require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:start_on) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_uniqueness_of(:start_time).scoped_to(:start_on) }
  end
end
