module Adapters
  class FoodForkConnection
    include HTTParty

    attr_reader :connection 

    def initialize
      @connection = self.class
    end

    def query(query)
      results = connection.get("http://food2fork.com/api/search?key=#{ENV["FOOD2FORK_KEY"]}", query: {q: query.name})
      json_results = JSON.parse(results, object_class: OpenStruct)
      first_recipe = [json_results.recipes.first.title, json_results.recipes.first.f2f_url]
    end
  end
end
