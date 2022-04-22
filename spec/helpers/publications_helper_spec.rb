# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publications', type: :request do
  include PublicationsHelper
  describe 'Publications helper methods' do
    it 'should return true' do
      publication_tittle = 'My first publication'
      first_letter(publication_tittle).should eq(true)
    end
  end
end
