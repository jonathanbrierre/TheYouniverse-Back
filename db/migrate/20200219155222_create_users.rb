class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :bio
      t.string :avatar, :default => 'https://i5.walmartimages.com/asr/39f4edb4-f7a9-4caf-b562-b20f8d135999_1.a5f5873d9043274b8d3a87f8108339be.jpeg?odnWidth=450&odnHeight=450&odnBg=ffffff'

      t.timestamps
    end
  end
end
