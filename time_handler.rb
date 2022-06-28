class TimeHandler
  TIME_FORMATS = {
    "year"   => "%Y",
    "month"  => "%m",
    "day"    => "%d",
    "hour"   => "%H",
    "minute" => "%M",
    "second" => "%S"
  }.freeze

  def initialize(array_query_params)
    @array_query_params = array_query_params
  end

  def format
    time_format = []
    unknown_format = []

    @array_query_params.each do |format|
      if TIME_FORMATS.has_key?(format)
        time_format << TIME_FORMATS[format]
      else
        unknown_format << format
      end
    end

    if has_unknown_format?
      { status: 400, body: "Unknown time format #{unknown_format}" }
    else
      { status: 200, body: Time.now.strftime(time_format.join("-")) }
    end
  end

  def has_unknown_format?
    (@array_query_params - TIME_FORMATS.keys).count.positive?
  end
end
