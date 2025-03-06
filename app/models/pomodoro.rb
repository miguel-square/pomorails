class Pomodoro < ApplicationRecord
  belongs_to :user

  validates :duration_minutes, presence: true

  scope :completed, -> { where(completed: true) }
  scope :abandoned, -> { where(completed: false).where.not(end_time: nil) }
  scope :in_progress, -> { where(end_time: nil) }
  scope :today, -> { where('start_time >= ?', Date.today.beginning_of_day) }
  scope :this_week, -> { where('start_time >= ?', Date.today.beginning_of_week) }
  
  def duration
    if end_time && start_time
      ((end_time - start_time) / 60).to_i
    else
      0
    end
  end
  
  def abandon
    update(end_time: Time.current, completed: false)
  end
  
  def complete
    update(end_time: Time.current, completed: true)
  end
end
