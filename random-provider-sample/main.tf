resource "random_integer" "random_int" {
  max = 800
  min = 300
}

output random_int_result {
  value = random_integer.random_int.result
}

resource "random_string" "random_string" {
  length = 20
}

output random_string_result {
  value = random_string.random_string.result
}