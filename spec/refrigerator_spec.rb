require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/item'

describe 'A refrigerator' do
  it 'has a total capacity equal to the chiller and freezer combined' do
    chiller = Chiller.new(80)
    freezer = Freezer.new(20)
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.total_capacity).to eq(100)
  end

  it 'has a remaining capacity equal to the chiller and freezer combined' do
    chiller = Chiller.new(80)
    freezer = Freezer.new(20)
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.remaining_capacity).to eq(100)
  end

  it 'reduces remaining capacity when items are chilled and frozen' do
    chiller = Chiller.new(80)
    freezer = Freezer.new(20)
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    refrigerator.chill(Item.new('Pizza', 5))
    refrigerator.freeze(Item.new('Dreamsicle', 1))

    expect(refrigerator.remaining_capacity).to eq(94)
  end

  it 'reports power off by default and on after being plugged in' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    expect(refrigerator.to_s).to include('Power: off')

    refrigerator.plug_in

    expect(refrigerator.to_s).to include('Power: on')
  end

  it 'changes chiller and freezer temperatures when levels are set' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    refrigerator.set_chiller_level(5)
    refrigerator.set_freezer_level(5)

    expect(chiller.temperature).to eq(45)
    expect(freezer.temperature).to eq(20)
  end

  it 'reports power off after being unplugged' do
    chiller = Chiller.new
    freezer = Freezer.new
    water_reservoir = WaterReservoir.new
    water_dispenser = WaterDispenser.new(water_reservoir)
    refrigerator = Refrigerator.new(chiller, freezer, water_dispenser, water_reservoir)

    refrigerator.plug_in
    refrigerator.unplug

    expect(refrigerator.to_s).to include('Power: off')
  end
end