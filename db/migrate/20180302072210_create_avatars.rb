class CreateAvatars < ActiveRecord::Migration[5.1]
  def self.up
    create_table :avatars do |t|
      t.attachment :image
      t.references :user, index: true

      t.timestamps
    end
  end

  def self.down
    drop_table :avatars
  end
end
