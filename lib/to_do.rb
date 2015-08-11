class Task

  @@tasks = []

  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def save
    @@tasks.push(self)
  end

  define_singleton_method(:view) do
    @@tasks
  end

  define_singleton_method(:clear) do
    @@tasks = []
  end

end
