require 'ev3dev'

class ColorSensor

  attr_reader :color_sensor
  def initialize
    @color_sensor =  Ev3dev::Sensor.new 3
    color_sensor.mode 'COL-COLOR'
  end

  def get_color
    color_num = color_sensor.value0.to_i
      case color_num
      when 1
        puts 'Black'
      when 2
        puts 'Blue'
      when 3
        puts 'Green'
      when 4
        puts 'Yellow'
      when 5
        puts 'Red'
      when 6
        puts 'White'
      when 7
        puts 'Brown'
      end
  end
end