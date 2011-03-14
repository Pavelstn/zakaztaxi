class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.integer :zakaz_id
      t.integer :taxist_id
      t.integer :time
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
