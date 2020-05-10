require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "Validations" do
    it { is_expected.to validate_presence_of(:start_on) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_uniqueness_of(:start_time).scoped_to(:start_on) }
  end

  describe "Custom Validations" do
    
    describe 'start_on is not in the past' do
      before(:all) { @schedule = build(:schedule) }
      
      context 'when start_on is in the past' do
        it 'is invalid' do
          @schedule.start_on = 2.days.ago.to_date

          @schedule.valid?

          expect(@schedule.errors[:start_on]).to include('no debe estar en el pasado')
        end
      end

      context 'when start_on is in the future' do 
        it 'is valid' do
          @schedule.start_on = 2.days.from_now.to_date

          expect(@schedule).to be_valid
        end
      end

      context 'when start_on is today' do 
        it 'is valid' do
          @schedule.start_on = Date.today

          expect(@schedule).to be_valid
        end
      end
    end

  end
end
