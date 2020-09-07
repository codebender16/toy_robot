require 'spec_helper'
require_relative '../../lib/models/robot.rb'

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0) }

  context 'movements of robot' do
    it 'moves 2 east' do
      2.times { subject.move }
      expect(subject.position).to eq(2)
    end

    it 'moves 5 west' do
      5.times { subject.move }
      expect(subject.position).to eq(5)
    end

  end

end

