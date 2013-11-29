# Implementation for
class Result
  def initialize
    @array_result = []
    @hash_result = {}
    @current_time = nil
  end

  def collapse_data_into_array(log_array_hash)
    log_array_hash.each do |value|
      create_array_of_hashes(value)
    end
    @array_result << @hash_result
  end

  def create_array_of_hashes(log_hash)
    log_hash.each do |key, value|
      if @current_time.nil?
        @current_time = value
      elsif  is_new_time_detected?(key, value)
        @array_result << @hash_result
        @hash_result = {}
        @current_time = value
      end
        @hash_result[key] = value
    end
  end

  def is_new_time_detected?(current_key, new_time)
    if (current_key == :time) && (new_time.nil? == false)
      @current_time != new_time
    end
  end
end
