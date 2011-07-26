require 'chess_position'

describe ChessPosition, "how position notation is validated" do
  it "should only accept string notation" do
    expect {ChessPosition.new 5}.to raise_exception
    expect {ChessPosition.new {}}.to raise_exception
  end
  
  it "should only accept two character strings" do
    expect {ChessPosition.new 'a'}.to raise_exception
    expect {ChessPosition.new '1'}.to raise_exception
    
    expect {ChessPosition.new 'ab1'}.to raise_exception
    expect {ChessPosition.new 'ab1'}.to raise_exception

    expect {ChessPosition.new 'a1'}.to_not raise_exception
    expect {ChessPosition.new 'z1'}.to_not raise_exception
    expect {ChessPosition.new 'a0'}.to_not raise_exception
  end
end

describe ChessPosition, "how validity is determined" do
  it "should only allow columns from a-h" do
    pos_i1 = ChessPosition.new 'i1'
    pos_z1 = ChessPosition.new 'z1'
                        
    pos_a1 = ChessPosition.new 'a1'
    pos_h1 = ChessPosition.new 'h1'
    
    pos_i1.valid?.should be_false
    pos_z1.valid?.should be_false

    pos_a1.valid?.should be_true
    pos_h1.valid?.should be_true
  end
  
  it "should only allow rows from 1-8" do
    pos_a0 = ChessPosition.new 'a0'
    pos_a9 = ChessPosition.new 'a9'

    pos_a1 = ChessPosition.new 'a1'
    pos_a8 = ChessPosition.new 'a8'
    
    pos_a0.valid?.should be_false
    pos_a9.valid?.should be_false
    pos_a1.valid?.should be_true
    pos_a8.valid?.should be_true
  end
end