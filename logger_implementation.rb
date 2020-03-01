class Logger
  # 1 => {start:xx end:yy}
  def initialize
    @buffer = {}
  end

  def start(process_id, start_at)
    @buffer[process_id] ||= {}
    @buffer[process_id][:s] = start_at
  end

  def stop(process_id, end_at)
    @buffer[process_id][:e] = end_at
  end

  def print
    @buffer.each do |k, v|
      puts "#{k} started at #{v[:s]}, ended at #{v[:e]}, duration #{v[:e] - v[:s]}"
    end
  end
end

log = Logger.new
log.start("1", 100)
log.start("2", 101)
log.stop("2", 102)
log.start("3", 103)
log.stop("1", 104)
log.stop("3", 105)
log.print()
