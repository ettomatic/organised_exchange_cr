module OrganisedExchange
  struct Event
    property start_time : Time
    setter end_time : Time

    setter title : String | Nil
    setter location : String | Nil
    setter description : String | Nil

    def initialize
      @start_time = Time::UNIX_EPOCH
      @end_time = Time::UNIX_EPOCH
    end

    def valid?
      @title != nil && @start_time != nil
    end

    def to_org
      if valid?
        "*#{@title}\n<#{org_time(@start_time)}>\n"
      end
    end

    # for now...
    private def org_time(time)
      if time
        time.to_utc
      end
    end
  end
end
