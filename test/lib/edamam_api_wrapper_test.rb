require 'test_helper'
describe EdamamApiWrapper do
  describe "get_recipies" do
    it "can return a list of recipies" do
      VCR.use_cassette("recipes") do
        result = EdamamApiWrapper.get_recipies("bread")
        result.must_be_kind_of Array
        result.each do |recipe|
          puts "phot url: #{recipe.photo}"
          recipe.must_be_kind_of Recipe
        end # .each
        result.length.must_be :>, 0
      end # VCR
    end # it can return a list of recipies

    it "will raise an error if the key is bad" do
      VCR.use_cassette("recipies") do
        proc {EdamamApiWrapper.get_recipies("bread", "badkey")}.must_raise EdamamApiWrapper::ApiError
      end # VCR
    end # bad token

    it "will do something if given a bugus search term that it has no results for" do
      # TODO
      # Maybe test response["count"] > 0?
      VCR.use_cassette("recipies") do
        proc {EdamamApiWrapper.get_recipies("xcd")}.must_raise EdamamApiWrapper::NoResultsError
      end # VCR
    end # bogus search term
  end # get_recipies
end # EdamamApiWrapper