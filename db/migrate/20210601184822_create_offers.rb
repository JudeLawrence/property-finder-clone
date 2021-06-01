class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.integer :offer_amount
      t.text :buyer_comment
      t.text :seller_comment
      t.boolean :offer_accepted
      t.references :user, null: false, foreign_key: true
      t.references :property_listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
