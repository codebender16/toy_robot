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

    it 'should only consider instructions after the first PLACE' do
      subject.sanitise_input([
        'MOVE',
        ['PLACE', 0, 0, 'NORTH'],
        'MOVE',
        'LEFT',
        ['PLACE', 2, 3, 'WEST'],
        'REPORT'
      ])
      expect(subject.commands).to eq([['PLACE', 0, 0, 'NORTH'], 'MOVE', 'LEFT', ['PLACE', 2, 3, 'WEST'],  'REPORT'])
    end

  end

  context 'execution of commands' do

    it 'should execute move for MOVE' do
      subject.place(0, 0, 'NORTH')
      subject.execute([
        'MOVE',
        'MOVE',
        'RIGHT',
        'MOVE',
        'REPORT'
      ])
      expect(subject.robot.position).to eq([1, 2])
      # expect(subject.report).to eq([])
    end

    it 'should execute report for REPORT' do
      subject.place(0, 0, 'NORTH')
      subject.execute([
        'MOVE',
        'MOVE',
        'RIGHT',
        'MOVE',
        'REPORT'
      ])
      expect(subject.robot.report).to eq({
        x: 1,
        y: 2,
        direction: 'EAST'
      })
      # expect(subject.report).to eq([])
    end

  end

  context 'moving in valid locations' do

    it 'should raise error if location is invalid' do
      subject.place(0, 0, 'WEST')
      subject.execute([
        'MOVE',
        'REPORT'
      ])
      expect(subject.valid_move?).to eq("Robot can only move within the table")
    end

    it 'should not move to invalid location' do
      subject.place(0, 0, 'NORTH')
      subject.execute([
        'MOVE',
        'MOVE',
        'LEFT',
        'MOVE',
        'MOVE',
        'REPORT'
      ])
      expect(subject.robot.position).to eq([0, 2])
    end

  end

end