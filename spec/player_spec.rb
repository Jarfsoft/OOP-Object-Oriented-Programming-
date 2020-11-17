require_relative '../lib/player'

describe 'Player' do
  player = Player.new('player', 'x')
  describe '#new' do
    it 'creates a new object' do
      expect(player).to be_a(Player)
    end
    it 'has a value of player name' do
      expect(player.name).to be_a(String)
    end
    it 'has a value of player symbol' do
      expect(player.symbol).to be_a(String)
    end
  end
end
