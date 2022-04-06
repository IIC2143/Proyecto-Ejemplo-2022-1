# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publication, type: :model do
  # Todo lo que está dentro de este bloque se ejecutará una vez antes de cada it
  before(:each) do
    # Creamos una instancia de la clase publicación "a mano", sin una factory
    @publication = Publication.new(title: 'A title', content: 'Content of the publication')
  end

  it 'is valid with valid attributes' do
    expect(@publication).to be_valid
  end

  it 'is not valid with no title' do
    @publication.title = nil
    expect(@publication).not_to be_valid
  end

  it 'is not valid with a title too short' do
    @publication.title = 'a'
    expect(@publication).not_to be_valid
  end

  it 'is not valid with no content' do
    @publication.content = nil
    expect(@publication).not_to be_valid
  end

  it 'is not valid with a content too short' do
    @publication.content = 'asd'
    expect(@publication).not_to be_valid
  end
end
