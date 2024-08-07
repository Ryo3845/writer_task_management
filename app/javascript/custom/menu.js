"use strict";

// ログイン後の三本線メニューの制御
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


document.addEventListener('DOMContentLoaded', () => {
  const structureDate = document.querySelector('.structure-date');
  const writingDate = document.querySelector('.writing-date');
  const cmsDate = document.querySelector('.cms-date');
  const editorDate = document.querySelector('.editor-date');
  const statusList = document.getElementById('status-list');

  const dateFields = [
    {
      container: structureDate,
      checkbox: structureDate.querySelector('input[type="checkbox"]'),
      dateInput: structureDate.querySelector('input[type="date"]'),
      type: 'structure'
    },
    {
      container: writingDate,
      checkbox: writingDate.querySelector('input[type="checkbox"]'),
      dateInput: writingDate.querySelector('input[type="date"]'),
      type: 'writing'
    },
    {
      container: cmsDate,
      checkbox: cmsDate.querySelector('input[type="checkbox"]'),
      dateInput: cmsDate.querySelector('input[type="date"]'),
      type: 'cms'
    },
    {
      container: editorDate,
      checkbox: editorDate.querySelector('input[type="checkbox"]'),
      dateInput: editorDate.querySelector('input[type="date"]'),
      type: 'editor'
    }
  ];

  const allStatuses = [
    {value: '', text: '--リストから選んでください--'},
    {value: 'before-starting', text: '着手前'},
    {value: 'structure-create', text: '構成作成中', type: 'structure'},
    {value: 'structure-collection', text: '構成修正中', type: 'structure'},
    {value: 'writing-create', text: '原稿執筆中', type: 'writing'},
    {value: 'writing-collection', text: '原稿修正中', type: 'writing'},
    {value: 'cms-create', text: 'CMS入稿中', type: 'cms'},
    {value: 'cms-collection', text: 'CMS入稿記事修正中', type: 'cms'},
    {value: 'structure-checking', text: '構成チェック中（編集業務）', type: 'editor'},
    {value: 'writing-checking', text: '原稿チェック中（編集業務）', type: 'editor'},
    {value: 'cms-checking', text: '入稿チェック中（編集業務）', type: 'editor'},
    {value: 'writer-checking', text: 'ライター対応中（編集業務）', type: 'editor'},
    {value: 'client-checking', text: 'クライアント確認中'}
  ];

  function preventDateEntry(field) {
    field.checkbox.addEventListener('change', () => {
      if (field.checkbox.checked) {
        field.dateInput.disabled = true;
        field.dateInput.value = '';
      } else {
        field.dateInput.disabled = false;
      }
      updateStatusList();
    });
  }

  function updateStatusList() {
    const checkedTypes = dateFields
      .filter(field => field.checkbox.checked)
      .map(field => field.type);

    const availableStatuses = allStatuses.filter(status => {
      if (!status.type) return true;
      if (status.type === 'editor') {
        return !checkedTypes.includes('editor');
      }
      return !checkedTypes.includes(status.type) || checkedTypes.includes('editor');
    });

    statusList.innerHTML = '';
    availableStatuses.forEach(status => {
      const option = document.createElement('option');
      option.value = status.value;
      option.textContent = status.text;
      statusList.appendChild(option);
    });
  }

  dateFields.forEach(field => preventDateEntry(field));
  updateStatusList(); // 初期状態を設定
});