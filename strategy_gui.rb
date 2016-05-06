require './motor'
require './color_sensor'

motor = Motor.new
color_sensor = ColorSensor.new

current_color = color_sensor.get_color

while current_color != 'Red' do
  motor.move_forward
  current_color = color_sensor.get_color
end

while current_color != 'Yellow' do
  motor.turn_left
  current_color = color_sensor.get_color
end