class CreateGroupRosters < ActiveRecord::Migration
  def change
    create_table :group_rosters do |t|
      t.references :user, index: true
      t.references :group, index: true

      t.timestamps
    end
  end
end
