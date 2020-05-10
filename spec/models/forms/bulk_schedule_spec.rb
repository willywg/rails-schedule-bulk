require 'rails_helper'

RSpec.describe Forms::BulkSchedule, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  describe "Custom Validations" do
    describe 'dates are not in the past' do
      before(:all) { @bulk_schedule = Forms::BulkSchedule.new }
      
      context 'when dates are in the past' do
        it 'is invalid' do
          @bulk_schedule.start_at = 2.days.ago.to_date
          @bulk_schedule.end_at = 3.days.ago.to_date

          @bulk_schedule.valid?

          aggregate_failures do
            expect(@bulk_schedule.errors[:start_at]).to include('no debe estar en el pasado')
            expect(@bulk_schedule.errors[:end_at]).to include('no debe estar en el pasado')
          end
        end
      end

      context 'when dates are in the future' do 
        it 'is valid' do
          @bulk_schedule.start_at = 2.days.from_now.to_date
          @bulk_schedule.end_at = 3.days.from_now.to_date

          expect(@bulk_schedule).to be_valid
        end
      end

      context 'when dates are today' do 
        it 'is valid' do
          @bulk_schedule.start_at = Date.today
          @bulk_schedule.end_at = Date.today

          expect(@bulk_schedule).to be_valid
        end
      end
    end

  end
end

