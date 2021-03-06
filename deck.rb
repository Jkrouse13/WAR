require_relative 'card'
class Deck

  attr_accessor  :card_holder

  def initialize
    create_deck
  end

  def create_deck
    faces =   %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    suits = %w(Clubs Spades Hearts Diamonds)
    self.card_holder = []

    faces.each do |face|
      suits.each do |suit|
        card_holder<< Card.new(face, suit)
      end
    end
  end

  def shuffle_cards
    card_holder.shuffle!
  end

  def draw
    card_holder.shift
  end

  def empty?
    card_holder.empty?
  end

  def length
    card_holder.length
  end

  def push(stuff)
    card_holder.push(stuff)
  end


end

# doozie = Deck.new
# puts doozie.length
#
# puts doozie.inspect
#
# doozie.shuffle_cards
# puts doozie.inspect
#
# puts doozie.draw.inspect
