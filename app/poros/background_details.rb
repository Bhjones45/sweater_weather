class BackgroundDetails
  attr_reader :id,
              :info

  def initialize(details, location)
    @id = nil
    @info = get_info(details, location)
  end

  private
    def get_info(details, location)
      {
        location: location,
        image_url: details[:results][0][:urls][:regular],
        credit: {
          source: 'unsplash.com',
          author: details[:results][0][:user][:username],
          logo: details[:results][0][:user][:profile_image][:medium]
        }
      }
    end
  end
