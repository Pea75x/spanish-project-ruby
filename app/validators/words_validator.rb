class WordsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return record.errors.add(attribute, "Can't be blank") if !value.present?

    record.errors.add(attribute, "Invalid characters") unless valid_characters.match?(value)
    record.errors.add(attribute, "Too long") unless value.length <= 30
  end

  def valid_characters
    /^[a-zA-Z0-9\.'\- _]+$/i
  end
end