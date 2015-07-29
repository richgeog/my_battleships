class Board

  attr_reader :grid

  def initialize
    @grid = []
  end

  def place_ship ship
    grid << ship
  end
end
