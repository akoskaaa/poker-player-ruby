
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

  describe '#is_straight' do

    it 'returns boolean' do

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

      expect (subject.is_straight(cards)).is_a? FalseClass

    end

    it 'false on short array' do

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

      expect (subject.is_straight(cards)).should be_false

    end

    it 'true on 23456' do

      cards = [
        {
            "rank" => "2",
            "suit" => "hearts"
        },
        {
            "rank" => "3",
            "suit" => "hearts"
        },
        {
            "rank" => "4",
            "suit" => "clubs"
        },
        {
            "rank" => "5",
            "suit" => "clubs"
        },
        {
            "rank" => "6",
            "suit" => "clubs"
        }
      ]

      expect (subject.is_straight(cards)).should be_true

    end

    it 'false on 23457' do

      cards = [
        {
            "rank" => "2",
            "suit" => "hearts"
        },
        {
            "rank" => "3",
            "suit" => "hearts"
        },
        {
            "rank" => "4",
            "suit" => "clubs"
        },
        {
            "rank" => "5",
            "suit" => "clubs"
        },
        {
            "rank" => "7",
            "suit" => "clubs"
        }
      ]

      expect (subject.is_straight(cards)).should be_false

    end

    it 'true on 787327' do

      cards = [
        {
            "rank" => "7",
            "suit" => "hearts"
        },
        {
            "rank" => "8",
            "suit" => "hearts"
        },
        {
            "rank" => "7",
            "suit" => "clubs"
        },
        {
            "rank" => "3",
            "suit" => "clubs"
        },
        {
            "rank" => "2",
            "suit" => "clubs"
        },
        {
            "rank" => "7",
            "suit" => "clubs"
        }
      ]

      expect (subject.is_straight(cards)).should be_false

    end

    it 'true on 2456789' do

      cards = [
        {
            "rank" => "2",
            "suit" => "hearts"
        },
        {
            "rank" => "4",
            "suit" => "hearts"
        },
        {
            "rank" => "5",
            "suit" => "clubs"
        },
        {
            "rank" => "6",
            "suit" => "clubs"
        },
        {
            "rank" => "7",
            "suit" => "clubs"
        },
        {
            "rank" => "8",
            "suit" => "clubs"
        },
        {
            "rank" => "9",
            "suit" => "clubs"
        }
      ]

      expect (subject.is_straight(cards)).should be_true

    end

  end

end
