
class CardHelpers

    def get_cards_from_state(game_state)

        card_ranks = []
        game_state['community_cards'].each do | community_card |
            card_ranks << community_card
        end

        game_state['players'][5]['hole_cards'].each do | card |
            card_ranks << card
        end

        card_ranks

    end

    def get_cards_from_hand(game_state)
        card_ranks = []
        game_state['community_cards'].each do | community_card |
            card_ranks << community_card
        end
        return card_ranks
    end

    def get_cards_from_table(game_state)
        card_ranks = []
        game_state['players'][5]['hole_cards'].each do | card |
            card_ranks << card
        end
        return card_ranks
    end

    def cards_are_same_color(cards, number)

        card_types = {
            'spades' => 0,
            'diamonds' => 0,
            'hearts' => 0,
            'clubs' => 0
        }

        cards.each do | card |
            card_type = card['suit']
            card_types[card_type] += 1
        end

        return number <= card_types.values.max

    end 

    def card_is_high(card)

      high_card = false

      c = card['rank']
      if c == "A" or c == "K" or c == "Q" or c == "J"
        high_card = true
      end 

      return high_card

    end

    def fill_card_hash(cards)

        h = Hash.new(0)

        cards.each do |card|
            c = card['rank']
            h[c] += 1
        end

        return h

    end

    def is_flush(cards)

        return cards_are_same_color(cards, 5)

    end

    def close_to_flush(game_state)

    end

end
