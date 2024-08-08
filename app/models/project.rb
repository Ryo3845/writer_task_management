class Project < ApplicationRecord
  enum status: {
    pending: 0,
    before_starting: 1,
    structure_create: 2,
    structure_collection: 3,
    writing_create: 4,
    writing_collection: 5,
    cms_create: 6,
    cms_collection: 7,
    structure_checking: 8,
    writing_checking: 9,
    cms_checking: 10,
    writer_checking: 11,
    select_keyword: 12,
    client_checking: 13,
    other_task: 14
  }

  def status_text
    I18n.t("enums.project.status.#{status}")
  end
end
