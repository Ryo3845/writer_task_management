'use strict';

{
  // ファイルの読み込み確認
  console.log("JavaScriptファイルは読み込まれています");

  document.addEventListener('turbo:load', () => {
    const body = document.body;
    const closeMenu = document.getElementById('close-menu');
    const openMenu = document.getElementById('open-menu');
    const overlay = document.querySelector('.overlay');

    // open-menuをクリックしたときにメニューを開き、また閉じる
    openMenu.addEventListener('click', (e) => {
      // 三本線メニュークリック確認
      console.log("三本線メニューはクリックされています");
      
      // スマホ画面での挙動
      if (window.innerWidth <= 768) {
        openMenu.style.display = 'none';
        closeMenu.style.display = 'block';
        body.classList.add('menu-open');
        e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
      }
      // PC・タブレット・スマホ画面での挙動
      overlay.classList.toggle('show-menu');
      e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
    });

    // close-menuをクリックした時に、メニューを閉じる（スマホのみ）
    closeMenu.addEventListener('click', (e) => {
      openMenu.style.display = 'block';
      closeMenu.style.display = 'none';
      overlay.classList.remove('show-menu');
      body.classList.remove('menu-open');
      e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
    })

    // ドキュメント全体にイベントリスナーを追加
    document.addEventListener('click', (e) => {
      if(overlay.classList.contains('show-menu') && !overlay.contains(e.target) && e.target !== openMenu) {
        overlay.classList.remove('show-menu');
      }
    });
  });
}