# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetMetrics do
  subject(:metrics) { described_class.call }

  it 'responds_to metrics' do
    expect(metrics).to respond_to(:unread)
    expect(metrics).to respond_to(:starred)
  end

  it 'creates metric objects' do
    expect(metrics.unread).to be_a(Metric)
    expect(metrics.starred).to be_a(Metric)
  end
end
