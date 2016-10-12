require_relative 'deck'

class Game

  attr_accessor :player_score, :computer_score, :rounds, :wars, :player_deck, :computer_deck, :starter, :result

  def play
    intro if starter
    get_decks
    shuffle_decks
    game_play
    result
    rematch
  end

  def initialize
    self.starter = true
  end


  def intro
    puts "Hello, welcome to WAR!"
    puts "Each player starts with a full, shuffled deck"
    puts "Players draw the card off of the top of their decks"
    puts "The winner is the player with the higher card!"
  end

  def get_decks
    self.player_deck = Deck.new
    self.computer_deck = Deck.new
    self.player_score = 0
    self.computer_score = 0
    self.wars = 0
    self.rounds = 0
  end

  def shuffle_decks
    player_deck.shuffle_cards
    computer_deck.shuffle_cards
  end

  def game_play
    until player_deck.empty?
      game_action
    end
  end

  def game_action
    player_card = player_deck.draw
    computer_card = computer_deck.draw

    if player_card > computer_card
      self.player_score += 1
      self.rounds += 1
    elsif player_card < computer_card
      self.computer_score += 1
      self.rounds += 1
    else
      self.wars += 1
      self.rounds += 1
    end
  end

  def result
    if player_score.to_i > computer_score.to_i
      puts "Player 1 won this game after #{rounds} rounds and survived #{wars} WARs. Would you like a rematch (y/n)?"
      rematch

    elsif player_score < computer_score
      puts "Computer won this game after #{rounds} rounds and survived #{wars} WARs. Would you like a rematch (y/n)?"
      rematch
    else
      puts "You tied this game after #{rounds} rounds and survived #{wars} WARs. Would you like a rematch (y/n)?"
      rematch
    end
  end

  def rematch
    answer =  gets.chomp.downcase
    if answer == "y"
      self.starter = false
      play
    else
      puts "Thanks for playing!"
      exit
    end
  end

end

Game.new.play
