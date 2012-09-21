class StaticPagesController < ApplicationController
  before_filter :authenticate_user!
  
  def home
  end
  
  def reports
  end
  
  def ziipreport
  end
   
  def cpureport
  end

  def configuration
  end

  def documents
  end

  def about
  end
  
  def data
  end
  
  def storageLayout
  end
  
  def dconfig
  end
end
