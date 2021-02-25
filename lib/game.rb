class Game
  attr_accessor :board_ui, :board_logic

  def initialize
    @board_ui = '    | 1 | 2 | 3 |
    | 4 | 5 | 6 |
    | 7 | 8 | 9 |'
    @board_logic = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def update_board_ui(player_move, player_sign)
    @board_ui.gsub!(player_move, player_sign)
  end

  def update_board_logic(player_move, player_sign)
    @board_logic = @board_logic.map! { |array| array.map! { |item| item == player_move.to_i ? player_sign : item } }
  end

  def row_win
    3.times do |i|
      return true if board_logic[i].all?(board_logic[i][0])
    end
    false
  end

  def column_win
    3.times do |i|
      return true if board_logic[0][i] == board_logic[1][i] && board_logic[1][i] == board_logic[2][i]
    end
    false
  end

  def diagonal_win
    true if (board_logic[0][0] == board_logic[1][1] && board_logic[1][1] == board_logic[2][2]) ||
            (board_logic[0][2] == board_logic[1][1] && board_logic[1][1] == board_logic[2][0])
  end

  def winning_condition
    row_win || column_win || diagonal_win
  end

  def valid_move?(player_move)
    return false if player_move.strip.length.zero?
    return true if board_ui.include? player_move.strip

    false
  end
end
