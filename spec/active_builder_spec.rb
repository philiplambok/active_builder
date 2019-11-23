# frozen_string_literal: true

RSpec.describe ActiveBuilder do
  it 'has a version number' do
    expect(ActiveBuilder::VERSION).not_to be nil
  end

  it 'works as expected' do
    date_time = DateTime.new
                        .with_day('Monday')
                        .with_month('December')
                        .with_year(2019)
    expect(date_time.day).to eq 'Monday'
    expect(date_time.month).to eq 'December'
    expect(date_time.year).to eq 2019
  end

  it 'returns nil as default value' do
    date_time = DateTime.new
    expect(date_time.day).to be_nil
    expect(date_time.month).to be_nil
    expect(date_time.year).to be_nil
  end

  private

  class DateTime
    include ActiveBuilder

    attributes :day
    attributes :month
    attributes :year
  end
end
