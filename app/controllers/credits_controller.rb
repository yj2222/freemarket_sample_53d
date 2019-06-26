class CreditsController < ApplicationController
  def index
    @years = [2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030]
    @months = [1,2,3,4,5,6,7,8,9,10,11,12]
  end
end
