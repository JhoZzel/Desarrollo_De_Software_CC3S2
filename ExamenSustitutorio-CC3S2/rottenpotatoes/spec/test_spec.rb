require 'rails_helper'

RSpec.describe Movie do
    describe "#name_with_rating" do
      it "returns the formatted name with rating" do
        fake_movie = double('Movie', title: "lol", rating: "P")

        #allow(fake_movie).to receive(:title).and_return('Casablanca')
        #allow(fake_movie).to receive(:rating).and_return('PG')
        puts "=========="
        puts fake_movie.inspect
        puts "=========="

        expect(fake_movie.name_with_rating).to eq 'lol'
      end
    end
  end