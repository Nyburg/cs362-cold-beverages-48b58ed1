require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do
  it 'has a default capacity and room temperature' do
    chiller = Chiller.new

    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to eq(70)
  end

  it 'reduces remaining capacity when an item is added' do
    chiller = Chiller.new
    item = Item.new('Pizza', 5)

    chiller.add(item)

    expect(chiller.remaining_capacity).to eq(95)
  end

  it 'sets its temperature based on level' do
    chiller = Chiller.new

    chiller.set_level(5)

    expect(chiller.temperature).to eq(45)
  end
end