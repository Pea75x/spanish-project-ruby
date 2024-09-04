class ThemesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    allowed_themes = record.model_name.name == "Sentence" ? (word_types.concat(sentence_types)) : word_types
    
    value.map do |theme|
      record.errors.add(attribute, "Must be in list of allowed themes") unless allowed_themes.include?(theme)
    end
  end

  def word_types
    JSON.parse(Rails.root.join("app/assets/data/word_types.json").read)
  end

  def sentence_types
    JSON.parse(Rails.root.join("app/assets/data/sentence_types.json").read)
  end
end