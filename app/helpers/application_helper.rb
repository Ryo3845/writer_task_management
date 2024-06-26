module ApplicationHelper

  #ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "WriterTask"
    home_title = "WriterTask - ライター案件管理ツール"
    if page_title.empty?
      home_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
