require 'spec_helper'
require_relative '../../lib/models/robot.rb'

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0,0, 'NORTH') }

  #1 test for original position when placed

  context 'original position' do
    it 'should place robot with position provided by command' do
      expect(subject.position).to eq([0,0])
    end
  end

  #2 test for movements of robot

  context 'movements of robot' do
    it 'moves 2 steps east' do
      2.times { subject.move_east }
      expect(subject.position).to eq([2, 0])
    end

    it 'moves 5 steps west' do
      5.times { subject.move_west }
      expect(subject.position).to eq([-5, 0])
    end

    it 'moves 2 steps north' do
      2.times { subject.move_north }
      expect(subject.position).to eq([0, 2])     
    end

    it 'moves 3 steps south' do
      3.times { subject.move_south }
      expect(subject.position).to eq([0, -3])    
    end

  end
  
  #3 test for direction robot is facing

  context 'the direction the robot is facing' do

    it 'show the correct direction' do
      expect(subject.direction).to eq('NORTH')
    end

  end

end

