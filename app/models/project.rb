class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :tasks

  enum status: {
    not_started: 0, #未着手
    in_progress: 1, #進行中
    reviewing: 2, #検品
    completed: 3, #納品完了
    on_hold: 4 #保留
  }

  def status_text
    I18n.t("enums.project.status.#{status}")
  end

  # タスク登録のステータス用の選択肢を返す
  def self.status_select_options
    statuses.keys.map { |s| [I18n.t("enums.project.status.#{s}"), s] }
  end

end
