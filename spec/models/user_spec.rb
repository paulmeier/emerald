require 'spec_helper'

  describe User do
    let(:user) { build(:user) }
    subject { user }
      its(:id) { should_not be_nil }
      its(:id) { should eq(99) }
  end
  