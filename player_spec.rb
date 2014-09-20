
require 'rspec'
require 'JSON'
require_relative 'player.rb'

describe Player do 

    describe '#bet_request' do

        it 'should return an int' do
            game_state = '{
              "players":[
                {
                  "name":"Player 1",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 1",
                  "id":0
                },
                {
                  "name":"Player 2",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 2",
                  "id":1
                },
                {
                  "name":"Player 2",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 2",
                  "id":1
                },
                {
                  "name":"Player 2",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 2",
                  "id":1
                },
                {
                  "name":"Player 5",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 2",
                  "id":1
                },
                {
                  "name":"Player 6",
                  "stack":1000,
                  "status":"active",
                  "bet":0,
                  "hole_cards":[],
                  "version":"Version name 2",
                  "id":1
                }
              ],
              "small_blind":10,
              "orbits":0,
              "dealer":0,
              "community_cards":[],
              "current_buy_in":0,
              "pot":0
            }'
            expect (subject.bet_request(JSON.parse game_state)).is_a? Integer
        end

    end

end

describe CardHelpers do 

  describe '#cards_are_same_color' do

    it 'returns boolean' do

      cards = [
        {
            "rank" => "4",
            "suit" => "spades"
        },
        {
            "rank" => "A",
            "suit" => "hearts"
        },
        {
            "rank" => "6",
            "suit" => "clubs"
        }
      ]

      expect (subject.cards_are_same_color(cards, 1)).is_a? TrueClass

    end

    it 'returns right amount' do

      cards = [
        {
            "rank" => "4",
            "suit" => "hearts"
        },
        {
            "rank" => "A",
            "suit" => "hearts"
        },
        {
            "rank" => "6",
            "suit" => "clubs"
        }
      ]

      expect (subject.cards_are_same_color(cards, 2)).is_a? TrueClass

    end

  end

end
