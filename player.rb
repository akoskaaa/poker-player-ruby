
class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    bet = 0
    game_state['players'][5]['hole_cards'].each do | card |
      if card['rank'] == "A"
        bet = 1000
      else
        bet = 100
      end
    end
    p bet
  end

  def showdown(game_state)

  end
end
