require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'database colummns' do
    it { should have_db_column :state }
  end
end
