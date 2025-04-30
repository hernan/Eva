module ApplicationHelper
  def lform_with(**options, &block)
    options[:builder] = CustomFormBuilder
    form_with(**options, &block)
  end

  def show_errors_for(model)
    return if model.errors.empty?
    content_tag(:div, class: "error-messages") do
      model.errors.full_messages.map { |msg| content_tag(:p, msg) }.join.html_safe
    end
  end
end
