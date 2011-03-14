class CreateZakazs < ActiveRecord::Migration
  def self.up
    create_table :zakazs do |t|
      t.integer :disp_id
      t.string :phone
      t.string :useradress
      t.datetime :createdate
      t.integer :maxtime
      t.integer :status
      t.integer :taxist_id

      t.timestamps
    end
  end

  def self.down
    drop_table :zakazs
  end
end
