'use strict'

document.addEventListener("turbo:load", () => {
  const openedMenu = document.getElementById('opened-menu')
  const overlay = document.getElementById('overlay')

  if (openedMenu && overlay) {
    openedMenu.addEventListener('click', (e) => {
      if (!e.target.hasAttribute('data-turbo-method')) {
        e.preventDefault();  // デフォルトの動作を防ぐが、伝播は許可
        overlay.classList.toggle('show-menu');
      }
    });

    document.addEventListener('click', (e) => {
      if (!overlay.contains(e.target) && !openedMenu.contains(e.target) && overlay.classList.contains('show-menu')) {
        overlay.classList.remove('show-menu');
      }
    });

    overlay.addEventListener('click', (e) => {
      if (!e.target.hasAttribute('data-turbo-method')) {
        e.preventDefault();  // デフォルトの動作を防ぐが、伝播は許可
      }
    });
  }
});

// クライアントリストの追加
const client = document.getElementById("clients")
const clientList = document.getElementById("client-list")

client.addEventListener(``)

