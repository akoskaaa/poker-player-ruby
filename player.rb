
require_relative 'helpers.rb'

class Player

  VERSION = "Default Ruby folding player"

  def bet_request(game_state)
    call =  game_state['current_buy_in'] - game_state['players'][5]['bet']
    bet = 0
    cardhelper = CardHelpers.new
    cards = cardhelper.get_cards_from_state(game_state)
    rank = evaluate_card(cards)
    if rank >= 3
      bet = game_state['players'][5]['stack']
    elsif rank == 2
      if bet <= game_state['players'][5]['stack']
        bet = call * 4
      else
        bet = game_state['players'][5]['stack']
      end
    elsif rank == 1
      bet = call
    end
    bet
  end

  def showdown(game_state)

  end

  def evaluate_card(cards)
    h = Hash.new(0)
    high_card = false
    pair = false
    two_pair = false
    three = false
    straight = false
    flush = false
    full_house = false
    four = false
    straight_flush = false
    royal_flush = false

    #High card
    cards.each do |c|
      if c == "A" or c == "K" or c == "Q" or c == "J"
        high_card = true
      end 
      h[c] +=1
    end

    #Pair, Two pair, Three, Four
    h.each do |k, v|
      if v == 2
        if pair == true
          two_pair == true
        end
        pair == true
      elsif v == 3
        three == true
      elsif v == 4
        four == true
      end 
    end

    #Full house
    full_house = pair and three

    if high_card
      return 1
    elsif pair
      return 2
    elsif two_pair
      return 3
    elsif three
      return 4
    elsif straight
      return 5
    elsif flush
      return 6
    elsif full_house
      return 7
    elsif four
      return 8
    elsif straight_flush
      return 9
    elsif royal_flush
      return 10
    else 
      return 0
    end
  end
end
