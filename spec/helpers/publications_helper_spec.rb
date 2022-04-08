require 'rails_helper'
include PublicationsHelper

RSpec.describe 'Publications', type: :request do

    describe 'Publications helper methods' do

        it 'should return true' do
            publication_tittle = 'My first publication'
            first_letter(publication_tittle).should eq(true)
        end
    end
end
