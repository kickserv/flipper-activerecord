class CreateFlipperTables < ActiveRecord::Migration
  def self.up
    create_table :flipper_features do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :flipper_features, :name, unique: true

    create_table :flipper_gates do |t|
      t.integer :flipper_feature_id, null: false
      t.string :name, null: false
      t.string :value
      t.timestamps null: false
    end
    add_index :flipper_gates, [:flipper_feature_id, :name, :value], unique: true
  end

  def self.down
    drop_table :flipper_gates
    drop_table :flipper_features
  end
end
