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
    // Esconde todas as abas
    this.tabTargets.forEach(tab => (tab.style.display = "none"))
    // Mostra a aba atual
    this.tabTargets[n].style.display = "block"
  }

  nextTab() {
    if (this.currentTab < this.tabTargets.length - 1) {
      this.tabTargets[this.currentTab].style.display = "none"
      this.currentTab++
      this.tabTargets[this.currentTab].style.display = "block"
    }
  }

  prevTab() {
    if (this.currentTab > 0) {
      this.tabTargets[this.currentTab].style.display = "none"
      this.currentTab--
      this.tabTargets[this.currentTab].style.display = "block"
    }
  }
}
