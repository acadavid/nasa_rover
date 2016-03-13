require_relative 'lib/plateau'
require_relative 'lib/rover'

ff = File.open("input.in").read

plateau = nil
current_rover = nil
ff.each_line.with_index do |l,i|
  l.gsub!("\n", '')

  if i == 0
    x, y = l.split(" ")
    plateau = Plateau.new(x.to_i, y.to_i)
    next
  end

  if i % 2 == 1
    x, y, h = l.split(" ")
    current_rover = Rover.new(x.to_i, y.to_i, h.upcase, plateau)
    plateau.add_rover(current_rover)
  end

  if i % 2 == 0
    current_rover.execute_movements(l)
  end
end

plateau.rovers.each do |r|
  puts "#{r.pos_x} #{r.pos_y} #{r.heading}"
end

