class StaticPagesController < ApplicationController
  
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
    @machineList = Location.find(params[:location]).machines
  end
  
  def dconfig
  end
end
