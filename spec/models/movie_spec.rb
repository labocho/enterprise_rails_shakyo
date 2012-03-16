# encoding: UTF-8

require 'spec_helper'

describe Movie do
  describe "database" do
    def raise_db_error
      raise_error(ActiveRecord::StatementInvalid)
    end

    [nil, ""].each do |v|
      it "name が #{v.inspect} なら raise" do
        movie = Movie.make(name: v)
        expect{ movie.save!(validate: false) }.to raise_db_error
      end
    end

    it "重複する name なら raise" do
      movie = Movie.make
      movie_dup = Movie.make(name: movie.name)
      expect{
        movie.save!(validate: false)
        movie_dup.save!(validate: false)
      }.to raise_db_error
    end

    [nil, "Unexpected"].each do |v|
      it "rating が #{v.inspect} なら raise" do
        movie = Movie.make(rating: v)
        expect{ movie.save!(validate: false) }.to raise_db_error
      end
    end

    [nil, 0, -10].each do |v|
      it "length が #{v.inspect} なら raise" do
        movie = Movie.make(length_minutes: v)
        expect{ movie.save!(validate: false) }.to raise_db_error
      end
    end
  end

  describe "validations" do
    [nil, ""].each do |v|
      it "name が #{v.inspect} なら invalid" do
        movie = Movie.make(name: v)
        movie.should be_invalid_for :name
      end
    end

    it "name が重複していたら invalid" do
      movie = Movie.make
      movie_dup = Movie.make(name: movie.name)
      movie.save!(validate: false)
      movie_dup.should be_invalid_for :name
    end

    [nil, "Unexpected"].each do |v|
      it "rating が #{v.inspect} なら invalid" do
        movie = Movie.make(rating: v)
        movie.should be_invalid_for :rating
      end
    end

    [nil, 0, -10].each do |v|
      it "length_minutes が #{v.inspect} なら invalid" do
        movie = Movie.make(length_minutes: v)
        movie.should be_invalid_for :length_minutes
      end
    end
  end
end
