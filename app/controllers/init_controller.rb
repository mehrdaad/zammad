# Copyright (C) 2012-2014 Zammad Foundation, http://zammad-foundation.org/

class InitController < ApplicationController

  # GET /init
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
