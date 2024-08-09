'use strict'
console.log("JavaScriptファイルは読み込まれています")
document.addEventListener('turbo:load', () => {
  const openMenu = document.getElementById('open-menu')
  const overlay = document.getElementById('overlay')
  const closeMenu = document.getElementById('close-menu')

  openMenu.addEventListener('click', () => {
    console.log("三本線メニューはクリックされています")
    overlay.classList.add('show-menu');
  })
});