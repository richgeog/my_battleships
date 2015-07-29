class Board

  attr_reader :grid

  def initialize
    @grid = {}
  end

  def place_ship ship, starting_square
    grid.store(ship, starting_square)
  end

  def locate_ship ship
    grid[ship]
  end
end
