'use strict';

{
  // ファイルの読み込み確認
  console.log("JavaScriptファイルは読み込まれています");  

  document.addEventListener('turbo:load', () => {
    const body = document.body;
    const main = document.main;
    const footer = document.footer;
    const closeMenu = document.getElementById('close-menu');
    const openMenu = document.getElementById('open-menu');
    const headerSidebar = document.querySelector('.header-sidebar');
    
    // オーバーレイの作成と追加
    const overlay = document.createElement('div');
    overlay.className = 'overlay';
    body.appendChild(overlay);

    // open-menuをクリックしたときにメニューを開き、また閉じる
    openMenu.addEventListener('click', (e) => {
      openMenu.style.display = 'none';
      closeMenu.style.display = 'block';
      headerSidebar.classList.add('active');
      overlay.classList.add('active');
      body.style.overflow = 'hidden';
      e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
    });

    // close-menuをクリックした時に、メニューを閉じる（スマホのみ）
    closeMenu.addEventListener('click', (e) => {
      openMenu.style.display = 'block';
      closeMenu.style.display = 'none';
      headerSidebar.classList.remove('active');
      overlay.classList.remove('active');
      e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
    })


    // ドキュメント全体にイベントリスナーを追加
    document.addEventListener('click', (e) => {
      if(overlay.classList.contains('show-menu') && !overlay.contains(e.target) && e.target !== openMenu) {
        overlay.classList.remove('show-menu');
        closeMenu.style.display = 'none';
        openMenu.style.display = 'block';
        e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
      }
    });
    // ユーザー設定のヘッダーをクリックした時に、そのメニューに移る
    const editHeaders = document.querySelectorAll('.edit-header li');
    const editSections = document.querySelectorAll('.edit-profile, .edit-mail, .edit-password');

    editHeaders.forEach((header, index) => {
      header.addEventListener('click', () => {
        // すべてのヘッダーからactiveクラスを削除
        editHeaders.forEach(h => h.classList.remove('active'));
        // クリックされたヘッダーにactiveクラスを追加
        header.classList.add('active');
        header.classList.add('no-hover');
        // すべてのセクションを非表示にする
        editSections.forEach(section => section.style.display = 'none');
        // クリックされたヘッダーに対応するセクションを表示する
        editSections[index].style.display = 'block';
      });
    });
  });
}