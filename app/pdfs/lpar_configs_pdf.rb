class LparConfigsPdf < Prawn::Document
  def initialize(lpar_configs, view_context)
    super(top_margin: 70, page_layout: :landscape)
    @lpar_configs = lpar_configs
    @view_context = view_context
    doc_header
    configs_list
  end
  
  def doc_header
    text "LPAR Configurations for #{Date.today.to_s(:long_ordinal)}", size: 20, style: :bold, align: :center
  end
  
  def configs_list
    move_down 20
    table configs_list_row do
      column(0).width = 55
      column(1).width = 40
      column(7).width = 40
      column(8).width = 50
      column(9).width = 40
      #columns(1..3).align = :center
      self.row_colors = ["DDDDDD", "FFFFCC"]
      row(0).font_style = :bold
    end
  end
  
  def configs_list_row
    [["Name", "MID", "Coded Weight", "Running Weight", "ZIIP Weight", "ZAAP Weight", "Local Engines", 
      "ZIIPs", "ZAAPs", "IFLs", "Storage CBU", "Storage Normal", "Reserved Storage"]] +
      @lpar_configs.map do |lpar_config|
      [ lpar_config.lpar.name, lpar_config.lpar.mid, lpar_config.codedWeight, lpar_config.runningWeight, lpar_config.ziipWeight,
        lpar_config.zaapWeight, lpar_config.localEngines, lpar_config.ziip, lpar_config.zaap, lpar_config.ifl, lpar_config.storageCbu,
        lpar_config.storageNormal, lpar_config.reservedStorage ]
    end
  end
end