module FlickrHelper
  
  def find_by_name(name)
      flickr.people.findByUsername(username: name) 
  end

  def get_pic_infos(id)
    flickr.people.getPhotos(user_id: id, per_page: 30, page: 1)
  end

  def get_error_message(e)
    /(?<= -\s).*/.match(e.msg)[0]
  end

  def build_url(info)
    "http://farm#{info['farm']}.staticflickr.com/#{info['server']}/#{info['id']}_#{info['secret']}.jpg"
  end

  def execute
    begin
      yield
    rescue => e
      flash.now[:error] = get_error_message(e) 
      render 'main'
    end
  end
end
