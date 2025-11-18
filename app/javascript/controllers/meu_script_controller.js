import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tab"]

  connect() {
    this.currentTab = 0
    this.showTab(this.currentTab)
  }

  showTab(n) {
    this.tabTargets.forEach(tab => tab.style.display = "none")
    this.tabTargets[n].style.display = "block"
  }

  nextTab() {
    // Valida antes de avançar
    if (!this.validateTab(this.currentTab)) {
      return
    }

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

  submit(event) {
    // Valida aba atual antes de permitir o submit
    if (!this.validateTab(this.currentTab)) {
      console.log("Envio impedido — faltam respostas.")
      event.preventDefault()
      return false
    }
  }

  validateTab(tabIndex) {
    const tab = this.tabTargets[tabIndex]
    const groups = tab.querySelectorAll(".form-group")
    let valid = true
    let firstInvalidGroup = null

    groups.forEach(group => {
      group.classList.remove("border-danger")

      const inputs = group.querySelectorAll("input, select, textarea")
      if (inputs.length === 0) return

      let answered = false

      inputs.forEach(input => {
        if (input.type === "radio" && input.checked) answered = true
        if (input.type === "checkbox" && input.checked) answered = true
        if (input.tagName === "SELECT" && input.value !== "") answered = true
        if (input.tagName === "TEXTAREA" && input.value.trim() !== "") answered = true
      })

      if (!answered) {
        valid = false
        group.classList.add("border-danger")
        group.style.borderWidth = "2px"

        if (!firstInvalidGroup) {
          firstInvalidGroup = group
        }
      }
    })

    // Scroll até o primeiro erro
    if (firstInvalidGroup) {
      firstInvalidGroup.scrollIntoView({ behavior: "smooth", block: "center" })
    }

    return valid
  }

  selectAllA() {
    document.querySelectorAll('input[id^="response_"]').forEach(radioButton => {
      if (radioButton.id.endsWith('_0')) {
        radioButton.checked = true
      }
    })
  }
}
