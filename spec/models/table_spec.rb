require 'spec_helper'
require_relative '../../lib/models/table.rb'

RSpec.describe Table do

  subject { Table.new(5, 5) }

  context 'check if table exists' do
    it 'should create table' do
      expect(subject.nil?).to be false
    end
  end

  context 'check for valid location' do
    it { should be_valid_location(0, 0) }
    it { should be_valid_location(4, 4) }
    it { should_not be_valid_location(5, 5) }
    it { should_not be_valid_location(-1, -1) }
  end

  

end