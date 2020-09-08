require 'spec_helper'
require_relative '../../lib/models/table.rb'

RSpec.describe Table do

  subject { Table.new(5, 5) }

  context 'when creating table' do
    it "should create an instance of Table" do
      expect(subject).to exist
    end
    
  end

end