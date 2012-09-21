require 'spec_helper'

  describe LparConfig do
    let(:lpar_config) { build(:lpar_config) }
      subject { lpar_config }
      it { should be_valid }
      its(:id) { should_not be_nil }
      its(:lpar_id) { should_not be_nil }
      it { should validate_presence_of(:codedWeight) }
      it { should validate_presence_of(:storageCbu) }
      it { should validate_presence_of(:localEngines) }
      it { should validate_presence_of(:lpar_id) }
      it { should validate_presence_of(:reservedStorage) }
      it { should validate_presence_of(:storageNormal) }
      it { should validate_numericality_of(:ifl) }
      it { should validate_numericality_of(:localEngines) }
      it { should validate_numericality_of(:lpar_id) }
      it { should validate_numericality_of(:reservedStorage) }
      it { should validate_numericality_of(:runningWeight) }
      it { should validate_numericality_of(:codedWeight) }
      it { should validate_numericality_of(:storageCbu) }
      it { should validate_numericality_of(:storageNormal) }
      it { should validate_numericality_of(:zaap) }
      it { should validate_numericality_of(:ziipWeight) }
      it { should validate_numericality_of(:capValue) }
  end