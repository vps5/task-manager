class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def complete
    Task.update(id, :status => 'completed')
  end

end
