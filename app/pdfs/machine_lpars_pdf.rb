class MachineLparsPdf < Prawn::Document
  def initialize(machine_lpars, view_context)
    super(top_margin: 70)
    @machine_lpars = machine_lpars
    @view_context = view_context
    doc_header
    machine_lpar_list
  end
  
  def doc_header
    text "Machines LPAR list for #{Date.today.to_s(:long_ordinal)}", size: 20, style: :bold, align: :center
  end
  
  def machine_lpar_list
    move_down 20
    indent(160) do
    table machine_lpar_list_row do
      #columns(1..3).align = :center
      #column(0).width = 50
      #column(1).width = 40
      #column(7).width = 40
      #column(8).width = 50
      #column(9).width = 40
      #columns(1..3).align = :center
      self.row_colors = ["DDDDDD", "FFFFCC"]
      row(0).font_style = :bold
    end
    end
  end
  
  def machine_lpar_list_row
    [["LPAR", "Machine"]] +
      @machine_lpars.map do |machine_lpar|
      [ machine_lpar.lpar.name, machine_lpar.machine.name ]
    end
  end
end