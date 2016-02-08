class Deck
  attr_reader :card_deck

  def initialize
    @card_deck = create_cards
  end

  def create_cards
    faces = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    suites = ["♣", "♠", "♥", "♦"]
    faces.map do |face|
      suites.map do |suit|
      "#{face}#{suit}"
        end
      end.flatten
    end

end