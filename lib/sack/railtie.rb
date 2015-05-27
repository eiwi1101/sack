module Sack
  class Railtie < Rails::Railtie

    initializer 'embeddable.add_view_paths', :after => :add_view_paths do |app|
      ActiveSupport.on_load(:action_controller) do
        require 'sack/template_resolver'
        view_paths.each do |path|
          append_view_path(Sack::TemplateResolver.new(path.to_s))
        end
      end
    end


  end
end
