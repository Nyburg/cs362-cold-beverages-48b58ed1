require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do
  it 'has a default capacity and room temperature' do
    freezer = Freezer.new

    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to eq(70)
  end

  it 'reduces remaining capacity when an item is added' do
    freezer = Freezer.new
    item = Item.new('Dreamsicle', 1)

    freezer.add(item)

    expect(freezer.remaining_capacity).to eq(99)
  end

  it 'sets its temperature based on level' do
    freezer = Freezer.new

    freezer.set_level(5)

    expect(freezer.temperature).to eq(20)
  end
end