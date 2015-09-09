module Kaminari
  module MongoidCriteriaMethods
    def initialize_copy(other) #:nodoc:
      @total_count = nil
      super
    end

    def entry_name
      target.model_name.human.downcase
    end

    def limit_value #:nodoc:
      target.options[:limit]
    end

    def offset_value #:nodoc:
      target.options[:skip]
    end

    def total_count #:nodoc:
      @total_count ||= if target.embedded?
        unpage.size
      else
        if target.options[:max_scan] && target.options[:max_scan] < size
          target.options[:max_scan]
        else
          size
        end
      end
    end

    private
    def unpage
      clone.tap do |crit|
        crit.options.delete :limit
        crit.options.delete :skip
      end
    end

    def target
      @_target ||= self.is_a?(::Mongoid::Contextual::Mongo) ? criteria : self
    end
  end
end
