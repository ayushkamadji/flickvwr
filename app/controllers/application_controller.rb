class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def main
    id = params[:id]
    if id
      execute do
        infos = get_pic_infos(id)
        @pic_urls = infos.map { |info| build_url(info) }
      end
    end
  end

  def get_flickr
    execute do
      user = find_by_name(params[:user_name])
      redirect_to "/#{user['id']}"
    end
  end
end
