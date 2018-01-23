require './lib/atm_demo.rb'

describe ATM do
  let(:account) { instance_double('Account', pin_code: '1234', exp_date: '02/18', account_status: :active) }
  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end

  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw(50, '1234', account)
    expect(subject.funds).to eq 950
  end

  it 'allow withdraw if account has enough balance.' do
    expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
    expect(subject.withdraw(45, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds', date: Date.today}
    expect(subject.withdraw(105, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if ATM has insufficient funds' do
    subject.funds = 50
    expected_output = { status: false, message: "insufficient funds in ATM", date: Date.today }
    expect(subject.withdraw(55,'1234', account)).to eq expected_output
  end

  it 'reject if withdraw if pin is wrong' do
    expected_output = { status: false, message: 'Wrong pin', date: Date.today}
    expect(subject.withdraw(53, 4323, account)).to eq expected_output
  end

  it 'rejects withdraw if card is expired' do
    allow(account).to receive(:exp_date).and_return('12/06')
    expected_output = { status: false, message: "expired card", date: Date.today }
    expect(subject.withdraw(16, '1234', account)).to eq expected_output
  end

  it 'rejects withdraw if account is disabled' do
    allow(account).to receive(:account_status).and_return(:disabled)
    expected_output = { status: false, message: "account disabled", date: Date.today }
    expect(subject.withdraw(69, '1234', account)).to eq expected_output
  end

end
