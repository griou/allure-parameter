require_relative '../spec_helper'
require 'pry'

RSpec.describe 'Google search' do
  context 'with google search opened' do

    before { visit('http://www.google.com') }

    it 'should display Agree terms' do
      expect(page).to have_css('#cnsw', visible: true)
    end
  end
end