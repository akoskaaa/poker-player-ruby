
require_relative 'helpers.rb'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    bet = 0
    cardhelper = CardHelpers.new
    cards = cardhelper.get_cards_from_state(game_state)
    rank = evaluate_card(cards)
    if rank == 2
      bet = game_state['players'][5]['stack']
    elsif rank == 1
      bet = 100
    end
    bet
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
    if pair or three
      return 2
    elsif high_card
      return 1
    else 
      return 0
    end
  end
end
