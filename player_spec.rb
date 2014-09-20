
require 'rspec'
require_relative 'player.rb'

describe Player do 

    describe '#bet_request' do

        it 'should return an int' do
            game_state = '{}'
            expect (subject.bet_request(game_state)).is_a? Integer
        end

    end

end
