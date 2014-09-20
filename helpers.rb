
class CardHelpers

    def get_cards_from_state(game_state)

        card_ranks = []
        game_state['community_cards'].each do | community_card |
            card_ranks << community_card['rank']
        end

        game_state['players'][5]['hole_cards'].each do | card |
            card_ranks << card['rank']
        end

        card_ranks

    end

    def cards_are_same_color(cards, number)

        card_types = {
            'spade' => 0,
            'diamond' => 0,
            'hearts' => 0,
            'clubs' => 0
        }

        cards.each do | card |
            card_type = card['suit']
            card_types[card_type] += 1
        end

        return number == card_types.values.max

    end 

    def close_to_flush(game_state)

    end

end
