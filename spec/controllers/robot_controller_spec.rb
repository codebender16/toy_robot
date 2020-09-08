require 'spec_helper'
require_relative '../../lib/controllers/robot_controller.rb'
require_relative '../../lib/models/table.rb'
require_relative '../../lib/models/robot.rb'

RSpec.describe RobotController do

  let(:table) { Table.new(5,5) }
  subject { RobotController.new(table) }
  
  context 'only create robot when it has a valid position' do

    it 'should place robot if position is valid' do
      subject.place(2, 3, 'NORTH')
      expect(subject.robot).to_not be_nil
    end

    it 'should not place robot if position is invalid' do
      subject.place(-1, 3, 'NORTH')
      expect(subject.robot).to be_nil
    end
  end

  context 'when receiving commands' do

    it 'should ignore all instructions if there is no PLACE' do
      subject.sanitise_input([
        'MOVE',
        'MOVE',
        'REPORT'
      ])
      expect(subject.commands).to be_nil
    end

    it 'should only consider instructions after PLACE' do
      subject.sanitise_input([
        'MOVE',
        'PLACE',
        'MOVE',
        'LEFT',
        'REPORT'
      ])
      expect(subject.commands).to eq(['PLACE', 'MOVE', 'LEFT', 'REPORT'])
    end

  end

  context 'execution of commands' do

    it 'should execute MOVE method in ' do

    end

  end

end