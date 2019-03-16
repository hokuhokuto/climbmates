module TimeSchedulesHelper
  def times
    times = []
    (0..23).each do |hour|
      ["00","15","30","45"].each do |min|
        times << ["#{hour} : #{min}"]
      end
    end
    return times
  end
end
