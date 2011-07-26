class ChessPosition
  @@columns = ('a'..'h').to_a
  @@rows = (1..8).to_a

  def initialize(pos_key)
    raise unless pos_key.is_a?(String) && pos_key.length == 2
    @col = pos_key[0].chr
    @row = pos_key[1].chr.to_i
  end
  
  def valid?
      @@columns.include?(@col) && @@rows.include?(@row)
  end
  
  def to_s
    "#{@col}#{@row}"
  end
end
