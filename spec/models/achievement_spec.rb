require 'rails_helper'

RSpec.describe Achievement do
	describe 'database columns' do
		it { should have_db_column :name }
		it { should have_db_column :description }
		it { should have_db_column :image }
		it { should have_db_column :seen }
	end

  describe 'associations' do
  	it { is_expected.to belong_to :achievementable }
  end
end