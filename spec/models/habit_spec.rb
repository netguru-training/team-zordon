require 'rails_helper'

RSpec.describe Habit do
  describe 'database colummns' do
    it { should have_db_column :name }
    it { should have_db_column :description }
    it { should have_db_column :small_name }
    it { should have_db_column :small_description }
    it { should have_db_column :active }
    it { should have_db_column :days }
  end
end
