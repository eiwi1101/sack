class Sack::TemplateResolver < ::ActionView::FileSystemResolver
  def find_templates(name, prefix, partial, details)
    prefix, name = prefix.split('/') if name == 'perform' && prefix.include?('/')
    super
  end
end
