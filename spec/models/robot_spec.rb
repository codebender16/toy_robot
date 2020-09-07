require 'spec_helper'
require_relative '../../lib/models/robot.rb'

RSpec.describe ToyRobot::Robot do
  subject { ToyRobot::Robot.new(0,0) }

  context 'original position' do
    it 'should place robot with position provided by command' do
      expect(subject.position).to eq([0,0])
    end
  end

  context 'movements of robot' do

    it 'moves 2 steps east' do
      2.times { subject.move_east }
      expect(subject.east).to eq(2)
    end

    it 'moves 5 steps west' do
      5.times { subject.move_west }
      expect(subject.west).to eq(-5)
    end

    it 'moves 2 steps north' do
      2.times { subject.move_west }
      expect(subject.north).to eq(2)     
    end

    it 'moves 3 steps south' do
      3.times { subject.move_west }
      expect(subject.south).to eq(-3)    
    end

  end

  context 'movements of robot with directions' do
    
    it 'moves 2 steps to the east' do
      2.times { subject.move_east }
      expect(subject.position).to eq(2)
    end

    it ''

  end

end

