class CreateLetterTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :letter_translations do |t|
      t.string :language_name
      t.string :language_code

      t.timestamps
    end
  end
end
