require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  let(:game) { Game.new }

  describe 'update_board_ui' do
    it 'updates the board ui' do
      expect(game.update_board_ui('1', 'X')).to eql("    | X | 2 | 3 |\n    | 4 | 5 | 6 |\n    | 7 | 8 | 9 |")
    end
  end

  describe 'update_board_logic' do
    it 'updates the board logic' do
      expect(game.update_board_logic(1, 'X')).to eql([['X', 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe 'row_win' do
    it 'returns false unless there is a row win' do
      expect(game.row_win).to eql(false)
    end
  end

  describe 'column_win' do
    it 'returns false unless there is a column win' do
      expect(game.column_win).to eql(false)
    end
  end

  describe 'diagonal_win' do
    it 'returns false unless there is a diagonal win' do
      expect(game.diagonal_win).to eql(false)
    end
  end

  describe 'winning_condition' do
    it 'returns false unless there is a winning condition' do
      expect(game.winning_condition).to eql(false)
    end
  end

  describe 'valid_move?' do
    it 'returns false unless there a valid move' do
      expect(game.valid_move?('10')).to eql(false)
    end
  end
end

describe Player do
  player = Player.new('Ryel', 'X', :blue)

  describe 'initialize' do
    it 'creates a player object' do
      expect(player.name).to eql('Ryel')
    end
    it 'creates a player object' do
      expect(player.name).not_to eql('Peter')
    end
  end
end
