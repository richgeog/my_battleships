require 'ship'

describe Ship do

  it 'has a type' do
    subject = Ship.new :submarine
    expect(subject.type).to be_truthy
  end

  it 'cannot be created with an invalid type' do
    expect{Ship.new :invalid}.to raise_error "Invalid ship type"
  end

end

#   it 'has a position when created' do
#     ship = Ship.new 'A1'
#     expect(ship.position).not_to eq nil
#   end
# end
