class Schedule < ApplicationRecord
  validates :name, presence: true
  validates :introduction, length: { in: 1..50 }
  validate :pretend_ago_end_day
  validate :pretend_ago_start
  validate :start_end_check

  def pretend_ago_end_day
    errors.add(:end_day, "は今日以降を選択する必要があります") if end_day.nil? || end_day < Date.today
  end

  def pretend_ago_start
    errors.add(:start, "は今日以降を選択する必要があります") if start.nil? || start < Date.today
  end

  def start_end_check
    errors.add(:end_day, "は開始日より前の日付は指定できません。") unless
    self.start < self.end_day || self.start = self.end_day
    end
end
