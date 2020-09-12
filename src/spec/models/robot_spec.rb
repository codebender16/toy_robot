require 'spec_helper'
require_relative '../../lib/models/robot.rb'

RSpec.describe Robot do
  
  subject { Robot.new(0,0, 'NORTH') }

  #1 test  original position when placed

  context 'when placed' do
    it 'should place robot with position provided by command' do
      expect(subject.position).to eq([0,0])
    end
  end

  #2 test  movements of robot

  context 'when robot is moving' do

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
  
  #3 test direction robot is facing

  context 'when robot is moving with direction' do
  
    subject { Robot.new(0,0, 'WEST') }

    it 'should have a direction' do
      expect(subject.direction).to eq('WEST')
    end
    # the left of WEST is SOUTH and right of WEST is NORTH
    it 'should be able to turn left' do
      subject.turn_left
      expect(subject.direction).to eq('SOUTH')
    end
    
    it 'should be able to turn right' do
      subject.turn_right
      expect(subject.direction).to eq('NORTH')
    end

    it 'should only move in the current direction' do
      2.times { subject.move }
      expect(subject.position).to eq([-2, 0])
    end

  end

  context 'reporting' do

    subject { Robot.new(2, 3, 'WEST') }

    it 'should print an output of the robot current position and direction' do
      expect(subject.report).to eq({
        x: 2,
        y: 3,
        direction: 'WEST' 
      })
    end

    
  end

end

