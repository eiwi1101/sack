class Sack::TemplateResolver < ::ActionView::FileSystemResolver
  def find_templates(name, prefix, partial, details, outside_app_allowed = false)
    if prefix.include?('/')
      parts  = prefix.split '/'

      if partial
        parts.pop #throw away last part
      else
        name = parts.pop
      end
      prefix = parts.join '/'
    end

    super
  end
end
