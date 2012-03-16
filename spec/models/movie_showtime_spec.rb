# encoding: UTF-8

require 'spec_helper'

describe MovieShowtime do
  describe "database" do
    def raise_db_error
      raise_error(ActiveRecord::StatementInvalid)
    end

    def next_id(model)
      (model.maximum("id") || 0) + 1
    end

    it "movie なしなら raise" do
      st = MovieShowtime.make(movie: nil)
      expect{ st.save(validate: false) }.to raise_db_error
    end
    it "theatre なしなら raise" do
      st = MovieShowtime.make(theatre: nil)
      expect{ st.save(validate: false) }.to raise_db_error
    end
    it "存在しない movie なら raise" do
      st = MovieShowtime.make(movie_id: next_id(Movie), movie: nil)
      expect{ st.save(validate: false) }.to raise_db_error
    end
    it "存在しない theatre なら raise" do
      st = MovieShowtime.make(theatre_id: next_id(Theatre), theatre: nil)
      expect{ st.save(validate: false) }.to raise_db_error
    end
    it "参照されている movie を削除すると raise" do
      movie = MovieShowtime.make!.movie
      expect{ movie.destoy_without_callbacks }
    end
    it "参照されている theatre を削除すると raise" do
      theatre = MovieShowtime.make!.theatre
      expect{ thatre.destoy_without_callbacks }
    end
  end

  describe "relations" do
    it "movie を削除すると関連するレコードは削除される" do
      movie = MovieShowtime.make!.movie
      movie.destroy
      MovieShowtime.where(movie_id: movie.id).count.should == 0
    end
    it "theatre を削除すると関連するレコードは削除される" do
      theatre = MovieShowtime.make!.theatre
      theatre.destroy
      MovieShowtime.where(theatre_id: theatre.id).count.should == 0
    end
  end

  describe "validations" do
    it "movie なしなら不正" do
      MovieShowtime.make(movie: nil).should_not be_valid
    end
    it "theatre なしなら不正" do
      MovieShowtime.make(theatre: nil).should_not be_valid
    end
  end
end

