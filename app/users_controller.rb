require 'time'
class UsersController
    def initialize(params)
      @params = params
    end
  
    def normalize 
      result = []
      first_name_index = @params[:percent_format][0].find_index("firstname")
      city_index = @params[:percent_format][0].find_index("city")
      birthdate_index = @params[:percent_format][0].find_index("birthdate")
      @params[:percent_format].each_with_index do |k, index|
        if index > 0
          result.push(k[first_name_index])
          result.push(k[city_index])
          time = Time.parse(k[birthdate_index])
          result.push(time.strftime("%m/%d/%Y"))
        end
      end
      first_name_index = @params[:dollar_format][0].find_index("firstname")
      city_index = @params[:dollar_format][0].find_index("city")
      birthdate_index = @params[:dollar_format][0].find_index("birthdate")
      @params[:dollar_format].each_with_index do |k, index|
        if index > 0
          result.push(k[first_name_index])
          result.push(k[city_index])
          time = Time.parse(k[birthdate_index])
          result.push(time.strftime("%m/%d/%Y"))
        end
      end
      result
    end
  
    private
  
    attr_reader :params
  end
  