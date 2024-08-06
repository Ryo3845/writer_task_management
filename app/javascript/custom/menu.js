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

// 進捗管理ページ

document.addEventListener('DOMContentLoaded', () => {
  const taskSelect = document.getElementById('task-list');
  const dateGroups = document.querySelectorAll('.date-group');

  function updateDateFields() {
    const selectedValue = taskSelect.value;
    dateGroups.forEach(group => {
      group.style.opacity = '0.5';
      group.querySelector('input').disabled = true;
    });

    // 最初にすべてのケースでタスク名を非表示にする
    hideTaskName();

    switch(selectedValue) {
      case 'structure':
        enableDateGroup('structure-date');
        break;
      case 'writing':
        enableDateGroup('writing-date');
        break;
      case 'cms':
        enableDateGroup('cms-date');
        break;
      case 'structure-writing':
        enableDateGroup('structure-date');
        enableDateGroup('writing-date');
        break;
      case 'writing-cms':
        enableDateGroup('writing-date');
        enableDateGroup('cms-date');
        break;
      case 'structure-writing-cms':
        enableDateGroup('structure-date');
        enableDateGroup('writing-date');
        enableDateGroup('cms-date');
        break;
      case 'structure-check':
      case 'writing-check':
      case 'cms-check':
      case 'select-keyword':
        enableDateGroup('other-date');
        break;
      case 'other':
        displayTaskName();
        enableDateGroup('other-date');
        break;
      default:
        // デフォルトでは何も有効にしない
        break;
    }
  }
  
  // タスクに応じて期日の項目を入力できるようにする
  function enableDateGroup(className) {
    const group = document.querySelector(`.${className}`);
    if (group) {
      group.style.opacity = '1';
      group.querySelector('input').disabled = false;
    }
  }

  // タスク名を非表示にする関数
  function hideTaskName() {
    const taskName = document.querySelector('.task-name');
    taskName.style.display = "none";
  }

  // 「その他タスク」を選択した場合、「タスク名」を表示させる
  function displayTaskName() {
    const taskName = document.querySelector('.task-name');
    taskName.style.display = "block";
  }
  
  taskSelect.addEventListener('change', updateDateFields);
  
  // 初期状態を設定
  updateDateFields();
});
