'use strict';

{
  // ファイルの読み込み確認
  console.log("JavaScriptファイルは読み込まれています");

  document.addEventListener('turbo:load', () => {
    const mainContens = document.getElementById('main-content');
    const openMenu = document.getElementById('open-menu');
    const overlay = document.getElementById('overlay');
  
    openMenu.addEventListener('click', (e) => {
      // 三本線メニュークリック確認
      console.log("三本線メニューはクリックされています");
      overlay.classList.toggle('show-menu');
      e.stopPropagation(); // メニューボタンのクリックがドキュメントに伝播するのを防ぐ
    });

    // ドキュメント全体にイベントリスナーを追加
    document.addEventListener('click', (e) => {
      if(overlay.classList.contains('show-menu') && !overlay.contains(e.target) && e.target !== openMenu) {
        overlay.classList.remove('show-menu');
      }
    });
  });
}