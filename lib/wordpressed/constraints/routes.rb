module Wordpressed
  module Constraints
    class MonthRoute
      def self.matches?(request)
        Constraints.matches_year?(request.params["year"]) && Constraints.matches_month?(request.params["month"])
      end
    end

    class ShowRoute
      def self.matches?(request)
        # check the post exists and the date is correct??
      end
    end


    def self.matches_year?(year)
      year =~ /\d{4}/
    end

    def self.matches_month?(month)
      return false unless month =~ /\d{1,2}/

      # check the month is in range
      m = month.sub(/^0/,"")
      (1..12).include?(m.to_i)
    end
  end
end