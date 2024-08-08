"use strict";

document.addEventListener('DOMContentLoaded', () => {
  const projectForm = document.getElementById('project-form');
  if (!projectForm) return;

  const statusList = document.getElementById('status-list');
  const otherTaskField = document.querySelector('.other-task');
  const taskDeadlineInput = projectForm.querySelector('#project_task_deadline');
  const finalDeadlineInput = projectForm.querySelector('#final_deadline_input');
  const finalDeadlineCheckbox = projectForm.querySelector('#final_deadline_checkbox');

  function updateFinalDeadline() {
    if (finalDeadlineCheckbox.checked) {
      finalDeadlineInput.value = taskDeadlineInput.value;
      finalDeadlineInput.disabled = true;
    } else {
      finalDeadlineInput.disabled = false;
    }
  }

  if (taskDeadlineInput && finalDeadlineInput && finalDeadlineCheckbox) {
    finalDeadlineCheckbox.addEventListener('change', updateFinalDeadline);
    taskDeadlineInput.addEventListener('change', updateFinalDeadline);
    
    // 初期状態の設定
    updateFinalDeadline();
  }

  if (projectForm && statusList && otherTaskField) {
    statusList.addEventListener('change', () => {
      if (statusList.value === 'other-task') {
        otherTaskField.style.display = 'block';
        otherTaskField.querySelector('input').required = true;
      } else {
        otherTaskField.style.display = 'none';
        otherTaskField.querySelector('input').required = false;
      }
    });

    projectForm.addEventListener('submit', (e) => {
      if (statusList.value === 'other-task' && !otherTaskField.querySelector('input').value.trim()) {
        e.preventDefault();
        alert('その他タスクの詳細を入力してください。');
      }
    });
  }
});

// ログイン後の三本線メニューの制御
document.addEventListener("turbo:load", () => {
  const openedMenu = document.getElementById('opened-menu')
  const overlay = document.getElementById('overlay')

  if (openedMenu && overlay) {
    openedMenu.addEventListener('click', (e) => {
      e.stopPropagation();  // イベントの伝播を停止
      overlay.classList.toggle('show-menu');
      if (!e.target.hasAttribute('data-turbo-method')) {
        e.preventDefault();  // デフォルトの動作を防ぐが、伝播は許可
        overlay.classList.toggle('show-menu');
      }
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
      if (!e.target.hasAttribute('data-turbo-method')) {
        e.preventDefault();  // デフォルトの動作を防ぐが、伝播は許可
      }
    });
  }
});