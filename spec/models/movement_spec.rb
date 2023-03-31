require 'rails_helper'

RSpec.describe Movement, type: :model do
  subject do
    @user = User.create(name: 'Marianela', email: 'marianela@gmail.com', password: '123456')
    @movement = Movement.create(name: 'food', amount: 10.0, user: @user)
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    subject.amount = -10.0
    expect(subject).to_not be_valid
  end
end
