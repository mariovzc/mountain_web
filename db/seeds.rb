payments = [
  "Tarjeta",
  "Efectivo",
  "Cheque"
]

payments.each{ |payment| PaymentType.create(name: payment)}