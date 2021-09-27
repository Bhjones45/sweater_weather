class BackgroundDetails
  attr_reader :id,
              :info

  def initialize(deatils, location)
    @id = nil
    @info = get_info(details, location)
  end
  
