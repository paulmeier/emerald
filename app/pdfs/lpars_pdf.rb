class LparsPdf < Prawn::Document
  def initialize(lpars)
    super(top_margin: 70)
    @lpars = lpars
    doc_header
    lpar_list
  end
  
  def doc_header
    text "LPARS for #{Date.today.to_s(:long_ordinal)}", size: 20, style: :bold, align: :center
  end
  
  def lpar_list
    move_down 20
    indent(175) do
    table lpar_list_row do
      #columns(0).font_style = :bold
      columns(1..3).align = :center
      self.row_colors = ["DDDDDD", "FFFFCC"]
      row(0).font_style = :bold
    end
   end
  end
  
  def lpar_list_row
    [["Name", "SMFID", "MACHINE_ID"]] +
      @lpars.map do |lpar|
      [lpar.name, lpar.smfid, lpar.mid]
    end
  end
end