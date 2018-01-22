require './lib/atm_demo.rb'

describe ATM do

  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'fund are reduced at withdraw' do
    subject.withdraw 50
    expect(subject.funds).to eq 950
  end
end
