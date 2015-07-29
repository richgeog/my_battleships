require 'board'

describe Board do

  let(:ship){ double(:ship) }
  let(:patrol_boat){ double :patrol_boat, type: :patrol_boat }

  it 'can have a ship' do
    subject.place_ship(ship, :B1)
    expect(subject.grid).to include ship
  end

  describe '#where_is_ship?' do
    context 'after placing a patrol_boat' do
      it "returns the patrol_boat's location" do
        subject.place_ship(patrol_boat, :A1)
        expect(subject.locate_ship(patrol_boat)).to eq :A1
      end
    end
  end

end
