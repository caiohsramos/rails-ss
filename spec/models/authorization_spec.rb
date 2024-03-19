# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Authorization do
  after(:all) do # rubocop:disable RSpec/BeforeAfterAll
    described_class.instance.username = 'admin'
    described_class.instance.password = 'password'
  end

  describe '.setup' do
    it 'sets the username and password' do # rubocop:disable RSpec/ExampleLength
      described_class.setup do |auth|
        auth.username = 'test_user'
        auth.password = 'test_password'
      end

      expect(described_class.instance.username).to eq('test_user')
      expect(described_class.instance.password).to eq('test_password')
    end
  end

  describe '#valid?' do
    let(:authorization) { described_class.instance }

    before do
      authorization.username = 'test_user'
      authorization.password = 'test_password'
    end

    it 'returns true for valid username and password' do
      expect(authorization.valid?('test_user', 'test_password')).to be true
    end

    it 'returns false for invalid username' do
      expect(authorization.valid?('invalid_user', 'test_password')).to be false
    end

    it 'returns false for invalid password' do
      expect(authorization.valid?('test_user', 'invalid_password')).to be false
    end
  end
end
