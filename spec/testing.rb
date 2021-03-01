require_relative '../lib/game'

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

  
end