
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

  def evaluate_card(cards)
    h = Hash.new(0)
    high_card = false
    pair = false
    three = false
    cards.each do |c|
      if c == "A" or c == "K" or c == "Q" or c == "J"
        high_card = true
      end 
      h[c] +=1
    end
    h.each do |k, v|
      if v == 2
        pair == true
      elsif v == 3
        three == true
      end 
    end
    if high_card or pair or three
      return 1 
    else
      return 0
    end
  end
end
