class ThemesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.empty?
    
    value.map do |theme|
      record.errors.add(attribute, "Must be in list of allowed themes") unless word_types.include?(theme)
    end
  end

  def word_types
    JSON.parse(Rails.root.join("app/assets/data/word_types.json").read)
  end
end