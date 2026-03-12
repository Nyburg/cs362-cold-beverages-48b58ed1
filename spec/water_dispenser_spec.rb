require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do
  it 'has a reservoir' do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)

    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'drains the reservoir by the vessel volume when dispensing' do
    reservoir = WaterReservoir.new(10, 8)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)

    dispenser.dispense(vessel)

    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'fills the vessel when dispensing' do
    reservoir = WaterReservoir.new(10, 8)
    dispenser = WaterDispenser.new(reservoir)
    vessel = Vessel.new('Cup', 3)

    expect(vessel).to be_empty

    dispenser.dispense(vessel)

    expect(vessel).not_to be_empty
  end
end