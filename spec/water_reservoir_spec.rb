require_relative '../lib/water_reservoir'

describe 'A water reservoir' do
  it 'has a capacity and current water volume' do
    reservoir = WaterReservoir.new(10, 3)

    expect(reservoir.capacity).to eq(10)
    expect(reservoir.current_water_volume).to eq(3)
  end

  it 'is empty when current water volume is zero' do
    reservoir = WaterReservoir.new(10, 0)

    expect(reservoir).to be_empty
  end

  it 'is not empty when current water volume is above zero' do
    reservoir = WaterReservoir.new(10, 4)

    expect(reservoir).not_to be_empty
  end

  it 'fills to capacity' do
    reservoir = WaterReservoir.new(10, 0)

    reservoir.fill

    expect(reservoir.current_water_volume).to eq(10)
  end

  it 'drains water by the requested volume' do
    reservoir = WaterReservoir.new(10, 8)

    reservoir.drain(3)

    expect(reservoir.current_water_volume).to eq(5)
  end

  it 'does not go below zero when drained past empty' do
    reservoir = WaterReservoir.new(10, 2)

    reservoir.drain(5)

    expect(reservoir.current_water_volume).to eq(0)
  end
end