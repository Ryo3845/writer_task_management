'use strict';

{
  // ファイルの読み込み確認
  console.log("JavaScriptファイルは読み込まれています");

  const menu = document.querySelector('.project-side-menu');
  const originalTop = menu.offsetTop;  // 初期位置を保存
  

  document.addEventListener('turbo:load', () => {
    const body = document.body;
    const closeMenu = document.getElementById('close-menu');
    const openMenu = document.getElementById('open-menu');
    const dropdownMenu = document.querySelector('.dropdown-menu');

    // open-menuをクリックしたときにメニューを開き、また閉じる
    openMenu.addEventListener('click', (e) => {
      openMenu.style.display = 'none';
      closeMenu.style.display = 'block';
      dropdownMenu.classList.add('show');
      e.stopPropagation(); // ほかのドキュメントに伝播するのを防止
    });

    // close-menuをクリックした時に、メニューを閉じる（スマホのみ）
    closeMenu.addEventListener('click', (e) => {
      openMenu.style.display = 'block';
      closeMenu.style.display = 'none';
      dropdownMenu.classList.remove('show');
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