class NotInPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    record.errors.add attribute, (options[:message] || "no debe estar en el pasado") if value < Date.today
  end
end