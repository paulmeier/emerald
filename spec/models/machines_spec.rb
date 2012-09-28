require 'spec_helper'

  describe Machine do
    let(:machine) { build(:machine) }
    subject { machine } 
      its(:id) { should_not be_nil }
      its(:name) { should_not be_nil }
      its(:name) { should include("CPU") }
      its("name.size") { should > 1 and should < 10 } 
      its(:serialNumber) { should_not be_nil }
      its("serialNumber.size") { should > 1 and should < 10 }     
      it { should be_valid }      
      it { should have_many(:machine_lpars) }
      it { should have_one(:machineConfig).dependent(:destroy) }
      it { should have_many(:lpars) }
      it { should have_many(:machine_locs) }
      it { should have_many(:locations) }
  end
  
  describe Machine do    
    let(:machine) { build(:machine, name: nil) }
    subject { machine }
      its(:name) { should be_nil }
      its(:id) { should_not be_nil }
      it { should_not be_valid }
      it { should validate_presence_of(:serialNumber) }
      it { should validate_presence_of(:name) }
  end
  
  describe Machine do
    it 'machine serialNumber wrong length should not be valid' do
      machine = build(:machine, serialNumber: '23456782A456782345C782345678')
      machine.should_not be_valid
    end
  end
  
  describe Machine do
    it 'name wrong length should not be valid' do
      machine = build(:machine, name: 'HOGPABOBLOBBOBLOBBOBLOBBOBLOBBOBLOBBOBLOBBOBLOBBOBLOB')
      machine.should_not be_valid
    end
  end
  
  describe Machine do
    it 'changes the number of Lpars' do
      machine = build(:machine)
      expect { machine.save }.to change { Machine.count }.by(1)
    end
  end
  
  describe Machine do
    it 'raises an error if saved without any attributes' do
      machine = Machine.new
      expect { machine.save! }.to raise_error( ActiveRecord::RecordInvalid )
    end
  end