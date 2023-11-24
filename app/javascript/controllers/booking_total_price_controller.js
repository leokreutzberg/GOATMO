import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['startDate', 'endDate', 'endPrice', 'btn']

  connect() {
    console.log('I am connected')
    console.log(this.startDateTarget)
    console.log(this.endDateTarget)
  }

  calculate() {
    const startDateString = this.startDateTarget.value
    const endDateString = this.endDateTarget.value

    const startDate = Date.parse(startDateString)
    const endDate = Date.parse(endDateString)

    const numOfDays = (endDate - startDate) / 1000 / 60 / 60 / 24 + 1
    console.log(numOfDays)

    const dailyPrice = parseInt(this.element.dataset.dailyPrice, 10)
    console.log(dailyPrice)

    const totalPrice = numOfDays * dailyPrice
    console.log(totalPrice)

    console.log(this.endPriceTarget)

    if (totalPrice > 0) {
      this.endPriceTarget.innerHTML = `
        <p>Total Days: ${numOfDays}</p>
        <p>Total Price: ${totalPrice}€</p>
      `
      this.btnTarget.disabled = false
    } else if (totalPrice < 0) {
      this.endPriceTarget.innerHTML = "Invalid dates, please change"
      this.btnTarget.disabled = true
    } else {
      this.btnTarget.disabled = true
    }
  }
}
