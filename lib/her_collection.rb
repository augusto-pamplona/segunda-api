module Her
  class Collection < ::Array
    def total_pages
      @metadata[:pagination][:total_pages]
    end

    def total_entries
      @metadata[:pagination][:total]
    end

    def offset
      @metadata[:pagination][:offset]
    end

    def current_page
      @metadata[:pagination][:current_page]
    end
  end
end
