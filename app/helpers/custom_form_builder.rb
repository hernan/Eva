class CustomFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :safe_join, to: :@template

  def text_field(method, options = {})
    tag.div(class: "form-field") do
      options["aria-invalid"] = true if has_error?(method)

      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super,
                  hint_text(options[:hint]),
                  error_text(method)
                ].compact_blank
    end
  end

  def checkbox(method, options = {}, checked_value = "1", unchecked_value = "0")
    tag.div(class: "form-field") do
      safe_join [
                  super,
                  label(method, options[:label]),
                  tag.p("") # Add a paragraph tag for spacing :)
                ]
    end
  end

  def rich_textarea(method, options = {})
    tag.div(class: "form-field") do
      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super
                ]
    end
  end

  def email_field(method, options = {})
    tag.div(class: "form-field") do
      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super,
                  hint_text(options[:hint])
                ]
    end
  end

  def password_field(method, options = {})
    tag.div(class: "form-field") do
      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super,
                  hint_text(options[:hint])
                ]
    end
  end

  def date_field(method, options = {})
    tag.div(class: "form-field") do
      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super,
                  hint_text(options[:hint])
                ]
    end
  end

  def select(method, choices = nil, options = {}, html_options = {})
    tag.div(class: "form-field") do
      safe_join [
                  (label(method, options[:label]) unless options[:label] == false),
                  super,
                  hint_text(options[:hint])
                ]
    end
  end

  private

  def hint_text(text)
    return if text.blank?
    tag.small text
  end

  def error_text(method)
    return unless has_error?(method)
    tag.small(@object.errors[method].join("<br />").html_safe, class: "form-field-error")
  end

  def has_error?(method)
    @object.respond_to?(:errors) && @object.errors[method].present?
  end
end
