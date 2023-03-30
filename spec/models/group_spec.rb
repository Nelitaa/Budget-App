require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.create(name: 'Marianela', email: 'marianela@gmail.com', password: '123456')
    @group = Group.create(name: 'food', icon: nil, user: @user)
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with out a icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
