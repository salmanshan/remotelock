require 'spec_helper'

RSpec.describe 'App Functional Test' do
  describe 'dollar and percent formats sorted by first_name' do
    let(:params) do
      {
        # dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        # percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        # order: :first_name,
        percent_format: File.readlines("spec/fixtures/people_by_percent.txt").map { |str| str.split("%").map{|s| s.gsub!(/[^0-9A-Za-z-]/, '')} },
        dollar_format: File.readlines("spec/fixtures/people_by_dollar.txt").map { |str| str.split("$").map{|s| s.gsub!(/[^0-9A-Za-z-]/, '')} }
      }
    end
    let(:users_controller) { UsersController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = users_controller.normalize

      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(normalized_people).to eq [
        'Elliot, New York City, 5/4/1947',
        'Mckayla, Atlanta, 5/29/1986',
        'Rhiannon, Los Angeles, 4/30/1974',
        'Rigoberto, New York City, 1/5/1962',
      ]
    end
  end
end
