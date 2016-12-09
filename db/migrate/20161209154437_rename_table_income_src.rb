class RenameTableIncomeSrc < ActiveRecord::Migration
  def self.up
    rename_table :income_source, :income_sources
  end

  def self.down
    rename_table :income_sources, :income_source
  end
end
