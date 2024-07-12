'use strict'

document.addEventListener("turbo:load", () => {
  const openedMenu = document.getElementById('opened-menu')
  const overlay = document.getElementById('overlay')

  if (openedMenu && overlay) {
    openedMenu.addEventListener('click', (e) => {
      e.stopPropagation();  // イベントの伝播を停止
      overlay.classList.toggle('show-menu');
    });

    // ドキュメント全体にクリックイベントリスナーを追加
    document.addEventListener('click', (e) => {
      // クリックされた要素がオーバーレイの外部であり、かつオーバーレイが表示されている場合
      if (!overlay.contains(e.target) && !openedMenu.contains(e.target) && overlay.classList.contains('show-menu')) {
        overlay.classList.remove('show-menu');
      }
    });

    // オーバーレイ自体にもクリックイベントリスナーを追加
    overlay.addEventListener('click', (e) => {
      e.stopPropagation();  // オーバーレイ内のクリックイベントの伝播を停止
    });
  }
});