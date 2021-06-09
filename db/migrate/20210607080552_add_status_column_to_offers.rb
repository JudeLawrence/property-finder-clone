class AddStatusColumnToOffers < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :status, :string, default: 'pending'
  end
end
