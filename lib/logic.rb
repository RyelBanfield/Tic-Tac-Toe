class Player
  attr_accessor :name, :sign

  def initialize(name, sign)
    @name = name
    @sign = sign
  end
end

class Game
  attr_accessor :board_ui, :board_logic

  def initialize
    @board_ui = '| 1 | 2 | 3 |
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
    true if (board_logic[0][0] == board_logic[0][1] && board_logic[0][1] == board_logic[0][2]) ||
            (board_logic[1][0] == board_logic[1][1] && board_logic[1][1] == board_logic[1][2]) ||
            (board_logic[2][0] == board_logic[2][1] && board_logic[2][1] == board_logic[2][2])
  end

  def column_win
    true if (board_logic[0][0] == board_logic[1][0] && board_logic[1][0] == board_logic[2][0]) ||
            (board_logic[0][1] == board_logic[1][1] && board_logic[1][1] == board_logic[2][1]) ||
            (board_logic[0][2] == board_logic[1][2] && board_logic[1][2] == board_logic[2][2])
  end

  def diagonal_win
    true if (board_logic[0][0] == board_logic[1][1] && board_logic[1][1] == board_logic[2][2]) ||
            (board_logic[0][2] == board_logic[1][1] && board_logic[1][1] == board_logic[2][0])
  end

  def winning_condition
    row_win || column_win || diagonal_win
  end
end
