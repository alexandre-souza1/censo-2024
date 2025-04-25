import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab"]

  connect() {
    console.log("Stimulus conectado: meu_script_controller")

    // Configuração inicial da aba
    this.currentTab = 0
    this.showTab(this.currentTab)
  }

  selectAllA() {
    // Seleciona todas as opções 'A'
    document.querySelectorAll('input[id^="response_"]').forEach(radioButton => {
      if (radioButton.id.endsWith('_0')) { // '0' representa a opção 'A'
        radioButton.checked = true
      }
    })
  }

  showTab(n) {
    this.tabTargets.forEach((tab, index) => {
      tab.classList.toggle("hidden", index !== n)
    })
  }

  nextTab() {
    if (this.currentTab < this.tabTargets.length - 1) {
      this.tabTargets[this.currentTab].classList.add("hidden")
      this.currentTab++
      this.tabTargets[this.currentTab].classList.remove("hidden")
    }
  }

  prevTab() {
    if (this.currentTab > 0) {
      this.tabTargets[this.currentTab].classList.add("hidden")
      this.currentTab--
      this.tabTargets[this.currentTab].classList.remove("hidden")
    }
  }
}

document.addEventListener('turbo:load', function() {
  const form = document.querySelector('form');
  if (!form) return;

  form.onsubmit = function(event) {
    let isValid = true;
    let firstEmptyElement = null;

    // Função para marcar campo como inválido
    function markInvalid(element) {
      isValid = false;
      element.style.backgroundColor = "#f8d7da";

      const formGroup = element.closest('.form-group');
      if (formGroup) {
        const label = formGroup.querySelector('label');
        if (label) label.style.color = "#dc3545";
      }

      if (!firstEmptyElement) firstEmptyElement = element;
    }

    // Função para limpar estilos de erro
    function clearErrorStyles(element) {
      element.style.backgroundColor = "";

      const formGroup = element.closest('.form-group');
      if (formGroup) {
        const label = formGroup.querySelector('label');
        if (label) label.style.color = "";
      }
    }

    // Validação para textareas e inputs de texto
    document.querySelectorAll('textarea, input[type="text"]').forEach(function(input) {
      if (input.value.trim() === "") {
        markInvalid(input);
      } else {
        clearErrorStyles(input);
      }
    });

    // Validação para grupos de radio buttons
    document.querySelectorAll('.form-group').forEach(function(group) {
      const radioButtons = group.querySelectorAll('input[type="radio"]');
      if (radioButtons.length > 0) {
        const isAnySelected = Array.from(radioButtons).some(radio => radio.checked);
        const label = group.querySelector('label');

        if (!isAnySelected && label) {
          isValid = false;
          label.style.color = "#dc3545";
          if (!firstEmptyElement) firstEmptyElement = label;
        } else if (label) {
          label.style.color = "";
        }
      }
    });

    // Validação para dropdowns
    document.querySelectorAll('.form-select').forEach(function(select) {
      if (select.value === "") {
        markInvalid(select);
      } else {
        clearErrorStyles(select);
      }
    });

    if (!isValid) {
      event.preventDefault();
      if (firstEmptyElement) {
        firstEmptyElement.scrollIntoView({
          behavior: 'smooth',
          block: 'center'
        });

        // Dá foco ao elemento se for um campo input/textarea/select
        if (firstEmptyElement.tagName === 'INPUT' ||
            firstEmptyElement.tagName === 'TEXTAREA' ||
            firstEmptyElement.tagName === 'SELECT') {
          firstEmptyElement.focus();
        }
      }
      alert("Por favor, responda todas as perguntas obrigatórias.");
    }
  };

  // Limpa os estilos de erro quando o usuário começa a preencher
  document.querySelectorAll('input, textarea, select').forEach(function(element) {
    element.addEventListener('input', function() {
      if (this.value.trim() !== "") {
        clearErrorStyles(this);
      }
    });
  });

  // Para radio buttons
  document.querySelectorAll('input[type="radio"]').forEach(function(radio) {
    radio.addEventListener('change', function() {
      const group = this.closest('.form-group');
      if (group) {
        const label = group.querySelector('label');
        if (label) label.style.color = "";
      }
    });
  });
});
