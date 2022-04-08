# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  # Similar al before each, pero ahora usando los métodos let y create de FactoryBot
  # Además, usamos la factory de perfiles que definimos
  let(:profile) { create(:profile) }
  let(:second_profile) { create(:profile) }

  it 'is valid with valid attributes' do
    expect(profile).to be_valid
  end
  # validates :age, numericality: { greater_than_or_equal_to: 0 }

  it 'is not valid without name' do
    profile.name = nil
    expect(profile).not_to be_valid
  end

  it 'is not valid with a name too short' do
    profile.name = 'a'
    expect(profile).not_to be_valid
  end

  it 'is not valid without description' do
    profile.description = nil
    expect(profile).not_to be_valid
  end

  it 'is not valid with a description too short' do
    profile.description = 'asd'
    expect(profile).not_to be_valid
  end

  it 'is not valid without an email' do
    profile.email = nil
    expect(profile).not_to be_valid
  end

  it 'is not valid with a repeated email' do
    profile.email = second_profile.email
    expect(profile).not_to be_valid
  end

  it 'is not valid without age' do
    profile.age = nil
    expect(profile).not_to be_valid
  end

  it 'is not valid with a string age' do
    profile.age = 'asd'
    expect(profile).not_to be_valid
  end

  it 'is not valid with a negative age' do
    profile.age = -1
    expect(profile).not_to be_valid
  end

  describe 'summary' do
    it 'contains the name, the age and the work of the profile' do
      expect(profile.summary).to eq("#{profile.name} - #{profile.age} - #{profile.work}")
    end
  end
end
