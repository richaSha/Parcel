require ('sinatra')
require ('sinatra/reloader')
also_reload('lib/**/*.rb')
require ('./lib/Parcel')
require ('pry')

get ('/') do
  erb(:input)
end

post ('/output') do
  @distance = params.fetch('distance')
  @weight = params.fetch('weight')
  @height = params.fetch('height')
  @width = params.fetch('width')
  @length = params.fetch('length')
  @parcel_type = params.fetch('parcel_type')
  @wrap_status = params.fetch('wrap') == 'on' ? 'false' : 'true'
  binding.pry
  # expect(Parcel.new(9,10,20,12,true,"super_express",19).cost_to_ship).to(eq(72))
  @cost = Parcel.new(@height.to_i, @width.to_i, @length.to_i, @weight.to_i, @wrap_status, @parcel_type,@distance.to_i).cost_to_ship
  erb(:output)
end
