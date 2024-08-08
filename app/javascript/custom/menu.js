"use strict";

document.addEventListener('DOMContentLoaded', () => {
  const projectForm = document.getElementById('project-form');
  if (!projectForm) {
    console.error("Project form not found");
    return;
  }

  const taskDeadlineInput = projectForm.querySelector('#task_deadline');
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
  } else {
    console.error("Required form elements not found");
  }

  console.log("Final deadline setup complete");
});

// ログイン後の三本線メニューの制御
document.addEventListener("turbo:load", () => {
  const openedMenu = document.getElementById('opened-menu');
  const overlay = document.getElementById('overlay');

  if (openedMenu && overlay) {
    openedMenu.addEventListener('click', (e) => {
      if (!e.target.hasAttribute('data-turbo-method')) {
        e.preventDefault();
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
        e.preventDefault();
      }
    });
  }
});