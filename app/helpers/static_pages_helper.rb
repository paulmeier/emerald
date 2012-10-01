module StaticPagesHelper
  def ziips_info(location)    
    if(contain_ziip_data(location))            
              capture_haml do
                    haml_tag :li, "ZIIP", class: "nav-header"
                    haml_tag :li do
                      haml_concat link_to "ZIIP Stats", ziipreport_path(location: location.id)
                      haml_concat link_to "ZIIP Custom", ziips_custom_path(1, location: location.id)
                      haml_concat link_to "ZIIP Canned", ziips_canned_path(1, location: location.id)
                    end

                  haml_tag :div, id: "accordion#{location.id}", class: "accordion" do
                    haml_tag :div, class: "accordion-group" do
                      haml_tag :div, class: "accordion-heading" do
                        haml_tag :a, class: "accordion-toggle", "data-parent" => "#accordion#{location.id}", "data-toggle" => "collapse", "href" => "#collapse#{location.id}" do
                          haml_concat "All Data"
                        end
                      end
                      
                      haml_tag :div, class: "accordion-body collapse", id: "collapse#{location.id}" do
                        haml_tag :div, class: "accordian-inner" do
                          haml_tag :ul, class: "nav nav-list" do
                            location.machines.each_with_index do |m,x|
                             if(m.machineConfig) 
                              if(m.machineConfig.ziip)
                                haml_tag :li do
                                  haml_concat link_to m.name, ziips_allAvg_path(m.id, m.name)
                                end
                              end
                             end
                              location.machines[x].lpars.each do |lpar|
                                if(Ziip.exists?(LPAR: lpar.name))
                                  haml_tag :li do
                                    haml_concat link_to lpar.name, ziips_all_path(1, lpar.name)
                                  end
                                end
                              end
                            end
                          end
                        end
                        
                      end
                    end
                    
                  end
              end
        end
    end
    
  def cpu_info(location)    
    if(contain_cpu_data(location))            
              capture_haml do
                    haml_tag :li, "CPU", class: "nav-header"
                    haml_tag :li do
                      haml_concat link_to "CPU Stats", cpureport_path(location: location.id)
                      haml_concat link_to "CPU Custom", cpus_custom_path(1, location: location.id)
                      haml_concat link_to "CPU Canned", cpus_canned_path(1, location: location.id)
                    end

                  haml_tag :div, id: "accordion2#{location.id}", class: "accordion" do
                    haml_tag :div, class: "accordion-group" do
                      haml_tag :div, class: "accordion-heading" do
                        haml_tag :a, class: "accordion-toggle", "data-parent" => "#accordion2#{location.id}", "data-toggle" => "collapse", "href" => "#collapse2#{location.id}" do
                          haml_concat "All Data"
                        end
                      end
                      
                      haml_tag :div, class: "accordion-body collapse", id: "collapse2#{location.id}" do
                        haml_tag :div, class: "accordian-inner" do
                          haml_tag :ul, class: "nav nav-list" do
                            location.machines.each_with_index do |m,x|
                              haml_tag :li do
                                if(Cpu.exists?(['smfid in (?)', m.lpars.map(&:smfid)]))
                                  haml_concat link_to m.name, cpus_allBox_path(m.id, m.name)
                                end
                             end
                              location.machines[x].lpars.each do |lpar|
                                if(Cpu.exists?(smfid: lpar.smfid))
                                  haml_tag :li do
                                    haml_concat link_to lpar.name, cpus_all_path(1, lpar.smfid)
                                  end
                                end
                              end
                            end
                          end
                        end
                        
                      end
                    end
                    
                  end
              end
        end
    end
    
    #Checks if a location has machines with ZIIP data.
    def contain_ziip_data(location)
      location.machines.each do |m|
        if(m.machineConfig)
            if(m.machineConfig.ziip)
              return true
            else
              return false
            end
         else
           return false
         end
      end
    end
    
        #Checks if a location has machines with ZIIP data.
    def contain_cpu_data(location)
      location.machines.each do |m|
        if(m.machineConfig)
            if(Cpu.exists?(['smfid in (?)', m.lpars.map(&:smfid)]))
              return true
            else
              return false
            end
         else
           return false
         end
      end
    end

end
