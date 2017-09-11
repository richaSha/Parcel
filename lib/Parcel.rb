class Parcel
  attr_accessor :height, :width, :length, :weight, :wrap, :parcel_type, :distance
  def initialize(height, width, length, weight, wrap, parcel_type,distance)
    @height = height
    @width = width
    @length = length
    @weight = weight
    @wrap = wrap
    @parcel_type = parcel_type
    @distance = distance
  end

  def cost_of_item
    if @distance <= 10
      return 2 * @weight
    elsif @distance <= 50
      return 5 * @weight
    elsif @distance <= 100
      return 10 * @weight
    elsif @distance <= 1000
      return 20 * @weight
    else
      return 50 * @weight
    end
  end

  def cost_of_wrap
    if @wrap == "true"
      case @height * @width * @length
      when (0..100)
        return 0
      when (100..500)
        return 2
      when (500..1000)
        return 5
      when (1000..10000)
        return  7
      when (10000..100000)
        return 10
      when (100000..1000000)
        return 12
      else
        return 15
      end
    else
      return 0
    end
  end

  def cost_asper_date
    case @parcel_type
    when ("super_express")
      return 5
    when ("express")
      return 2
    else
      return 0
    end
  end

  def cost_to_ship
    
    cost_of_item + cost_of_wrap + cost_asper_date
  end

end
