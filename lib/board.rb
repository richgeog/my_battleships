class Board

  attr_reader :ships

  def initialize
    @ships = {}
  end

  def place_ship ship, location, direction
    occupied_squares = occupies_squares(ship, location, direction)
    unless (ships.values.flatten & occupied_squares).empty?
      raise "Ships cannot overlap"
    end
    ships.store(ship, occupied_squares)
  end

  def occupies_squares ship, location, direction
    starting_square = location
    squares = [starting_square]
    direction = direction.to_sym.upcase

    # NB! might make a separate method that checks all positioning conditions

    unless [:N,:S,:E,:W].include?(direction)
      raise "Invalid direction. Please choose between N, S, W, E."
    end

    if direction == :S
      x = 0
        ( ship_size(ship.type) - 1 ).times do
        squares << (squares[x]).next
        x += 1
      end
    end

    if direction == :N
      x = 0
        ( ship_size(ship.type) - 1 ).times do
        location = location.to_s
        first_char = location[0]
        second_char = (location[1].to_i - 1).to_s
        location = (first_char + second_char).to_sym
        squares << location
        x += 1
      end
    end

    if direction == :E
      x = 0
        ( ship_size(ship.type) - 1 ).times do
        location = location.to_s
        first_char = location[0].next
        second_char = location[1]
        location = (first_char + second_char).to_sym
        squares << location
        x += 1
      end
    end

    if direction == :W
      x = 0
        ( ship_size(ship.type) - 1 ).times do
        location = location.to_s
        first_char = (location[0].ord - 1).chr
        second_char = location[1]
        location = (first_char + second_char).to_sym
        squares << location
        x += 1
      end
    end

    squares
  end

  def overlaps?

  end

  def locate_ship ship
    ships[ship] # array of symbols, it's the value of the key ship in the hash
  end

  def ship_size type
    sizes = {patrol_boat: 2, destroyer: 3, submarine: 3, battleship: 4, aircraft_carrier: 5}
    sizes[type] # whatever the size for that type
  end
end
