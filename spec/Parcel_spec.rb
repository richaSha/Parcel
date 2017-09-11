require ('rspec')
require ('./lib/Parcel')
require ('pry')

describe('parcel') do
  it('will return cost of item parcel') do
    expect(Parcel.new(0,0,0,12,'false',0,19).cost_of_item).to(eq(60))
  end

  it('will return cost of gift wrap') do
    expect(Parcel.new(9,10,20,0,'true',0,19).cost_of_wrap).to(eq(7))
    expect(Parcel.new(1,2,2,0,'true',0,19).cost_of_wrap).to(eq(0))
    expect(Parcel.new(1,2,2,0,'false',0,19).cost_of_wrap).to(eq(0))
  end

  it('will return cost as per date') do
    expect(Parcel.new(1,2,2,0,'false',"normal",19).cost_asper_date).to(eq(0))
    expect(Parcel.new(1,2,2,0,'false',"express",19).cost_asper_date).to(eq(2))
    expect(Parcel.new(1,2,2,0,'false',"super_express",19).cost_asper_date).to(eq(5))
  end

  it('will return total parcel cost') do
    # expect(Parcel.new(1,2,2,12,'false',"normal",19).cost_to_ship).to(eq(60))
    # expect(Parcel.new(1,2,2,12,'true',"express",19).cost_to_ship).to(eq(62))
    expect(Parcel.new(9,10,20,12,'true',"super_express",19).cost_to_ship).to(eq(72))
  end

end
