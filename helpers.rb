
class CardHelpers

    def get_cards_from_state(game_state)

        our_index = game_state['in_action']

        card_ranks = []
        game_state['community_cards'].each do | community_card |
            card_ranks << community_card['rank']
        end

        game_state['players'][our_index]['hole_cards'].each do | card |
            card_ranks << card['rank']
        end

        card_ranks

    end

end
