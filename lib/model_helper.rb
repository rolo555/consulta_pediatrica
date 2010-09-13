module ModelHelper
  def clean_whitespaces(*args)
    args.each { |field| field.strip! if field.presence }
  end
end