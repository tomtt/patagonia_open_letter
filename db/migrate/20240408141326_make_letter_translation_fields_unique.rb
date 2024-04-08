class MakeLetterTranslationFieldsUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :letter_translations, :language_name, unique: true
  end
end
