require('rspec')
require('to_do')



describe(Task) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new("scrub the zebra")
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end
  describe("#add") do
    it("Adds tasks to a task array") do
      test_task = Task.new("scrub the zebra")
      test_task.save()
      expect(Task.view()).to(eq([test_task]))
    end
  end
end
