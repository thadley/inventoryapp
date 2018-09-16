class Inventory < ApplicationRecord
  
  def current_unit_cost_display
    self.current_unit_cost ? "$" + ("%.2f" % BigDecimal.new(self.current_unit_cost).truncate(2).to_s) : nil
  end
end
