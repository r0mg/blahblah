require "pry"
require_relative "deck"
require_relative "player"
require_relative "table"
require_relative "game"

deck = Deck.new
game = Game.new(deck.card_deck)
game.game_play_loop