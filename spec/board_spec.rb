require 'board'

describe Board do

  let(:ship){ double(:ship) }

  it 'can have a ship' do
    subject.place_ship(ship)
    expect(subject.grid).to include(ship)
  end

end
