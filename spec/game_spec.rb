require_relative '../lib/game'

describe 'Game' do
  before(:each) do
    @game = Game.new
  end
  describe '#new' do
    it 'creates a new object' do
      expect(@game).to be_a(Game)
    end
    it 'has a grid 3x3' do
      expect(@game.grid).to eq([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end
  describe 'print_grid' do
    it 'displays the grid' do
      expect(@game.print_grid).to eq("   |   |  \n---+---+---\n   |   |  \n---+---+---\n   |   |  \n\n\n")
    end
  end
  describe 'validate_move' do
    it 'validates the right input' do
      txt = "\n\n===============================\n------- Invalid entry ---------\n==============================="
      expect(@game.validate_move(4, 1, 'x')).to eq(txt)
    end
    it 'validates space not taken' do
      @game.validate_move(1, 1, 'x')
      txt = "\n\n===============================\n-------- Space taken ----------\n==============================="
      expect(@game.validate_move(1, 1, 'x')).to eq(txt)
    end
    it 'return empty string if right input' do
      expect(@game.validate_move(1, 1, 'x')).to eq('')
    end
  end
  describe 'finish_draw' do
    it 'validates not draw' do
      expect(@game.finish_draw).to eq(nil)
    end
    it 'validate draw' do
      (1..3).each do |i|
        (1..3).each do |j|
          @game.validate_move(i, j, 'k')
        end
      end
      expect(@game.finish_draw).to eq(true)
    end
  end
  describe 'finish_win' do
    it 'validates if continue' do
      expect(@game.finish_win('x')).to eq(false)
    end
    it 'validate a win' do
      (1..3).each do |i|
        @game.validate_move(i, i, 'x')
      end
      expect(@game.finish_win('x')).to eq(true)
    end
  end
end
