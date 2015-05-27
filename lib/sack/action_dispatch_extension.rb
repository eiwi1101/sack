module Sack::ActionDispatchExtension
  def get(*args, &block)
    args = add_default_action(args)
    super
  end

  def post(*args, &block)
    args = add_default_action(args)
    super
  end

  private
  def add_default_action(args)
    if args.size == 1 && args.first.is_a?(Hash)
      unless args[0].values[0].include? '#'
        args = [{args[0].keys[0] => "#{args[0].values[0]}#perform" }]
      end
    end

    args
  end
end

ActionDispatch::Routing::Mapper.prepend(Sack::ActionDispatchExtension)
