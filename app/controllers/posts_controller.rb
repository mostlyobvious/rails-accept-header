Mime::Type.register 'application/vnd.blog.v1+json', :json_v1
Mime::Type.register 'application/vnd.blog.v2+json', :json_v2

class PostsController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::ImplicitRender

  def index
    render :json         => { :message => 'Same, regardless of Accept header.' },
           :content_type => 'application/vnd.blog.v1+json'
  end

  def create
    respond_to do |format|
      format.json_v1 { render :json => { :message => 'Such header, much version.' } }
      format.json_v2 { render :json => { :message => 'Wow.' } }
    end
  end

end
