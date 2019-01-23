class AddFildObs < ActiveRecord::Migration
  def self.up
    add_column :chamados,:obs, :text
  end

  def self.down
    remove_column :chamados, :obs

  end
end



