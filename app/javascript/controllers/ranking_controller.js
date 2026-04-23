import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select"]

  connect() {
    this.update()
  }

  update() {
    // pega todos os valores selecionados
    const selectedValues = this.selectTargets
      .map(select => select.value)
      .filter(v => v !== "")

    this.selectTargets.forEach(select => {
      const currentValue = select.value

      Array.from(select.options).forEach(option => {
        if (option.value === "") return // ignora "Selecione..."

        // se o valor já foi usado em outro select → desabilita
        if (
          selectedValues.includes(option.value) &&
          option.value !== currentValue
        ) {
          option.disabled = true
        } else {
          option.disabled = false
        }
      })
    })
  }
}
