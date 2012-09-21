class MachineConfigsPdf < Prawn::Document
  def initialize(machine_configs, view_context)
    super(top_margin: 70, page_layout: :landscape)
    @machine_configs = machine_configs
    @view_context = view_context
    doc_header
    configs_list
  end
  
  def doc_header
    text "Machine Configurations for #{Date.today.to_s(:long_ordinal)}", size: 20, style: :bold, align: :center
  end
  
  def configs_list
    move_down 20
    indent(50) do
    table configs_list_row do
      columns(0..15).size = 12
      #column(0).width = 45
      #column(1).width = 40
      #column(2).width = 35
      #column(3).width = 60
      #column(5).width = 40
      #column(7).width = 50
      #column(8).width = 50
      #column(9).width = 50
      #column(10).width = 50
      #column(11).width = 60
      #column(12).width = 30
      self.row_colors = ["DDDDDD", "FFFFCC"]
      row(0).font_style = :bold
    end
    end
  end
  
  def configs_list_row
    [["Name", "Type", "Model", "Capacity", "Central Storage", "ZIIPs", "ICFs",
        "CBU", "Infiniband", "ES", "FI", "OSA", "Crypto"]] +
      @machine_configs.map do |machine_config|
      [ machine_config.machine.name, machine_config.capacity.name, machine_config.mod.name, machine_config.capacity.capSetting, machine_config.centralStorage,
        machine_config.ziip, machine_config.icf, machine_config.cbu, machine_config.ifb, machine_config.es, machine_config.fi, machine_config.osa, machine_config.crypto]
    end
  end
end