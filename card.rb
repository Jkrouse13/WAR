class Card

  include Comparable

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    card_value
  end

  def card_value
    if face == "K"
      self.value = 13
    elsif face == "Q"
      self.value = 12
    elsif face == "J"
      self.value = 11
    elsif face == "A"
      self.value = 14
    else
      self.value = face.to_i
    end
  end

  def > (other)
    value.to_i > other.value.to_i
  end

  def < other
    value.to_i < other.value.to_i
  end


end


faces =   %w(A 2 3 4 5 6 7 8 9 10 J Q K)



# suits =   %w(clubs diamonds hearts spades)

# card1 = Card.new("Q", "Clubs")
# #
# card2 = Card.new("K", "Hearts")
#
# card3 = Card.new("A", "Spades")
#
# puts card1.inspect
# puts card2.inspect
# puts card3.inspect
