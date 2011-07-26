require 'chess_position'

class KT
  def initialize(start, destination, blocked = [])
    invalid_positions = invalid_positions(start, destination, *blocked)
    unless invalid_positions.empty? then raise Exception end
    @start = start
    @destination = destination
  end
  
  private
  
  def invalid_positions(*args)
    args.select do |arg|  
      !ChessPosition.new(arg).valid?
    end
  end
end