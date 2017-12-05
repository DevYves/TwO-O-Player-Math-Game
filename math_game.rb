require './player'
require './question'

module MathGame

  class Game

    def self.main
      game = Game.new
      game.start
    end

    def initialize
      @players = [
        MathGame::Player.new('Player 1'),
        MathGame::Player.new('Player 2')
      ]
      @current_player = 0
    end

    def start
      greet_players

      until game_over? do
        puts "#{current_player.name}, Your question:"
        @new = MathGame::Question.new
        @current_question = @new.random_question
        lose_life(@current_question)
        current_lives
        swap_players
      end
      puts "                   ^^^^^^^^^^^^^^^^"
      puts "                     ^^^^^^^^^^^^"
      puts "                      ^^^^^^^^^^"
      puts "       Game            ^^^^^^^^          Over"
      puts "       ----             ^^^^^^           ----"
      puts "                         ^^^^"
      puts "                          ^^"
      puts "#{@players[@current_player].name}, your journey ends here."
      swap_players
      puts "Congratulations, #{@players[@current_player].name}"
    end

    def greet_players
         puts "                          ^^"
         puts "                         ^^^^"
         puts "       ----             ^^^^^^         -----------"
         puts "      Welcome          ^^^^^^^^        Challengers"
         puts "                      ^^^^^^^^^^"
         puts "                     ^^^^^^^^^^^^"
         puts "                   ^^^^^^^^^^^^^^^^"
         puts "                    MATH CHALLENGE"

      @players.each do |player|
        puts "Hello #{player.name}"
        puts "Would you like to change your name #{player.name}? (y/N)"


        if gets.chomp == 'y'
          print "Enter your new name: "
          player.name = gets.chomp
          puts "Your new name is: #{player.name}"
        end
      end
    end

    def current_player
      @players[@current_player]
    end

    def swap_players
      @current_player = (@current_player + 1) % @players.length
    end

    def lose_life(question)
      if question == true
      else
        @players[@current_player].lose_life
      end
    end

    def current_lives
      @players.each do |player|
        puts "#{player.name} has #{player.lives} lives remaining"
      end
    end

    def game_over?
      @players.any? { |player| player.lives == 0 }
    end
  end
end
