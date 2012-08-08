#encoding:utf-8
class HomeController < ApplicationController
  load_and_authorize_resource
  def index

  end
  def download_manual
   #send_file("#{Rails.root.to_s}/lib/assets/manual.pdf", :filename => "Manual_SEIAS.pdf")
   send_file("#{Rails.root.to_s}/public/manual.pdf", :filename => "Manual_SEIAS.pdf")
  end
end
