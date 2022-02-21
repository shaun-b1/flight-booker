class ChangeDurationToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :duration, :integer
  end
end
