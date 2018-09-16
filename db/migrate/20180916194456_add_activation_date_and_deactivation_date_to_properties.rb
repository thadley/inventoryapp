class AddActivationDateAndDeactivationDateToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :activation_date, :date
    add_column :properties, :deactivation_date, :date
  end
end
