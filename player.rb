
require_relative 'helpers.rb'
require_relative 'const.rb'

class Player

  VERSION = "Default Ruby folding player"
  $counter = 0

  def bet_request(game_state)
    call =  game_state['current_buy_in'] - game_state['players'][5]['bet']
    bet = 0
    cardhelper = CardHelpers.new
    cards = cardhelper.get_cards_from_state(game_state)
    table_cards = cardhelper.get_cards_from_table(game_state)
    hand_cards = cardhelper.get_cards_from_hand(game_state)
    rank = evaluate_card(cards)


    p '##########'
    p 'counter', $counter, 'rank', rank, 'call', call, 'stack', game_state['players'][5]['stack'], 'cards', cards
    p '##########'

    if table_cards.length > 2
      table_rank = evaluate_card(table_cards)
      hand_rank = evaluate_card(hand_cards)
      if table_rank >= 2 and hand_rank < 3 and rank < 5
        return 0
      end
    end

    if rank >= 5
      p '#### higher or equal 5'
      bet = game_state['players'][5]['stack']
    elsif rank == 4 or rank == 3
      p '#### 4 or 3'
      bet = call
      if call >= game_state['players'][5]['stack'] / 0.5
        bet = 0
      end
    # elsif rank == 2
    #   if bet <= game_state['players'][5]['stack']
    #     bet = call * 4
    #   else
    #     bet = game_state['players'][5]['stack']
    #   end
    else
      p '#### 2,1,0 shit'
      if call <= 150
        $counter += 1
        if $counter > 3
          $counter = 0
          return 0
        end
        return call
      end 
    end
    bet
  end

  def showdown(game_state)

  end

  def evaluate_card(cards)

    cardhelper = CardHelpers.new

    h = Hash.new(0)
    high_card = false
    pair = false
    high_pair = false
    two_pair = false
    three = false
    straight = false
    flush = false
    full_house = false
    four = false
    straight_flush = false
    royal_flush = false

    h = cardhelper.fill_card_hash(cards)

    flush = cardhelper.is_flush(cards)

    #Pair, Two pair, Three, Four
    h.each do |k, v|
      if v == 2
        if k == "A" or k == "K" or k == "Q" or k == "J"
          high_pair = true
        end
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

    if royal_flush
      return 11
    elsif straight_flush
      return 10
    elsif four
      return 9
    elsif full_house
      return 8
    elsif flush
      return 7
    elsif straight
      return 6
    elsif three
      return 5
    elsif two_pair
      return 4
    elsif high_pair
      return 3
    elsif pair
      return 2
    elsif high_card
      return 1
    else 
      return 0
    end
  end
end
