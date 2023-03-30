require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    @user = User.create(name: 'Marianela', email: 'marianela@gmail.com', password: '123456')
  end

  before { subject.save }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
