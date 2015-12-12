require 'spec_helper'

describe HabitDecorator do
  let(:habit) { build :habit }

  describe "#active_name" do
    subject { habit.decorate.active_name }
    it { is_expected.to eq 'Suspended' }
  end
end
