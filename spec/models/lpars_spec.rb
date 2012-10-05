require_relative '../spec_helper'

  describe Lpar do
    let(:lpar) { build(:lpar) }
    subject { lpar }
      its(:id) { should_not be_nil }
      its(:id) { should eq(85) }
      its(:name) { should_not be_nil }
      its("name.size") { should > 3 and should < 8 }      
      its(:mid) { should_not be_nil }
      its("mid.size") { should >= 2 and should < 5 }      
      its(:smfid) { should_not be_nil }
      its("smfid.size") { should >= 2 and should < 7 } 
      its(:name) { should include("BOGP") }
      it { should have_many(:machine_lpars) }
      it { should have_one(:lparConfig).dependent(:destroy) }
      it { should have_many(:machines) }
      it { should be_valid }
  end
  
  describe Lpar do    
    let(:lpar) { build(:lpar, name: nil) }
    subject { lpar }
      its(:name) { should be_nil }
      it { should_not be_valid }
      its(:id) { should_not be_nil }
      it { should validate_presence_of(:smfid) }
      it { should validate_presence_of(:mid) }
      it { should validate_presence_of(:name) }
      it { should allow_mass_assignment_of(:id) }
      it { should allow_mass_assignment_of(:smfid) }
      it { should allow_mass_assignment_of(:mid) }
      it { should allow_mass_assignment_of(:name) }
  end
  
  describe Lpar do
    it 'lpar mid wrong length should not be valid' do
      lpar = build(:lpar, mid: '2345678')
      lpar.should_not be_valid
    end
  end
    
  describe Lpar do
    it 'lpar name wrong length should not be valid' do
      lpar = build(:lpar, name: 'HOGPABOBLOB')
      lpar.should_not be_valid
    end
  end
  
  describe Lpar do
    it 'changes the number of Lpars' do
      lpar = build(:lpar)
      expect { lpar.save }.to change { Lpar.count }.by(1)
    end
  end
  
  describe Lpar do
    it 'raises an error if saved without any attributes' do
      lpar = Lpar.new
      expect { lpar.save! }.to raise_error( ActiveRecord::RecordInvalid )
    end
  end
