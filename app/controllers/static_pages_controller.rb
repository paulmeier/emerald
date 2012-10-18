class StaticPagesController < ApplicationController
  
  def home
    @notifications = Notification.all 
  end
  
  def reports
    #Gather the locations from the database
    @locations = Location.all
    
    #Check if the location contains machines.
    @locations.delete_if{ |x| !x.machine_locs.exists? }
  end
  
  def ziipreport    
    #Get the locations machines.
    @machines = Location.find(params[:location]).machines
    
    #Make sure the machine has a ZIIP. If not, dont even bother querying for information.
    @machines.delete_if{ |x| x.machineConfig.ziip <= 0 }
  end
   
  def cpureport
  end

  def configuration
  end

  def documents
    @locations = Location.all
    
    #Check if the location contains machines.
    @locations.delete_if{ |x| !x.machine_locs.exists? }
  end

  def about
    require 'socket'
    @host = Socket.gethostname
  end
  
  def storageLayout
    #Get the locations machines.
    @machineList = Location.find(params[:location]).machines
  end
  
  def dconfig
  end
end
