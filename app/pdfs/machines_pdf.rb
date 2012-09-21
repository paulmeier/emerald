class MachinesPdf < Prawn::Document
  def initialize(machines, view_context)
    super(top_margin: 70)
    @machines = machines
    @view_context = view_context
    doc_header
    machines_list
  end
  
  def doc_header
    text "Machines for #{Date.today.to_s(:long_ordinal)}", size: 20, style: :bold, align: :center
  end
  
  def machines_list
    move_down 20
    indent(160) do
    table machines_list_row do
      columns(1..2).align = :center
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
  
  def machines_list_row
    [["Name", "Serial Number" ]] +
      @machines.map do |machine|
      [ machine.name, machine.serialNumber ]
    end
  end
end