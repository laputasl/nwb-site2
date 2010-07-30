# Needed to prevent errors when caching (nested) ActiveRecord objects in memcached
#
# Marshal.load is a C-method built into Ruby; because it's so low-level, it
# bypasses the full classloading chain in Ruby, in particular the #const_missing
# hook that Rails uses to auto-load classes as they're referenced. This monkey
# patch catches the generated exceptions, parses the message to determine the
# offending constant name, loads the constant, and tries again.
#
# This solution is adapted from here:
# http://kballcodes.com/2009/09/05/rails-memcached-a-better-solution-to-the-undefined-classmodule-problem/
#
class <<Marshal
  def load_with_rails_classloader(*args)
    begin
      load_without_rails_classloader(*args)
    rescue ArgumentError, NameError => e
      if e.message =~ %r(undefined class/module)
        const = e.message.split(' ').last
        const.constantize
        retry
      else
        raise(e)
      end
    end
  end

  alias_method_chain :load, :rails_classloader
end