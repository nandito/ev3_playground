require './motor'
require './color_sensor'

motor = Motor.new
color_sensor = ColorSensor.new

current_color = color_sensor.current_color

while current_color != 'Red'
  motor.move_forward
  current_color = color_sensor.current_color
end

while current_color != 'Yellow'
  motor.rotate_left
  current_color = color_sensor.current_color
end
