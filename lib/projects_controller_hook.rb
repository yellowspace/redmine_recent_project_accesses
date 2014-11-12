module RecentProjectAccesses
  module ProjectsControllerHook
    METHODS = %w(show)
    def self.included klass
      klass.send(:include, InstanceMethods)
      klass.class_eval do
        unloadable
        METHODS.each do |method|
          alias_method_chain method.to_sym, :save_access
        end
      end
    end

    module InstanceMethods
      METHODS.each do |method|
        define_method("#{method}_with_save_access") do
          self.send("#{method}_without_save_access")
          logger.info "methods called"
          RecentProjectAccess.save_access(User.current, @project)
        end
      end
    end
  end
end
