
module Kaminari
  module MongoidContextualExtension

    def paginates_per(val)
      criteria.paginates_per(val)
    end

    def default_per_page
      criteria.per_page
    end

    def max_paginates_per(val)
      criteria.max_paginates_per(val)
    end

    def max_per_page
      criteria.max_per_page
    end

    def max_pages_per(val)
      criteria.max_pages_per(val)
    end

    def max_pages
      criteria.max_pages
    end
  end
end
