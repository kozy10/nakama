class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
    	t.string :name
      t.timestamps
    end
  end
end
