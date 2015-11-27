module Adapters
  class MenuItemClient
    def connection
      @connection = Adapters::FoodForkConnection.new
    end

    def find_by_ingredient(ingredient)
      results = connection.query(ingredient)
    end
  end
end