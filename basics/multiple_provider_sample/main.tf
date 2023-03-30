/*Implicit dependency*/
resource "local_file" "sample_res" {
  filename = "implicit.txt"
  content = "Disco! Disco! Disco! ${random_string.random_string.result}"
  /* Defining dependency explicitly */
  depends_on = [random_string.random_string]
}

resource "random_string" "random_string" {
  length = 20
}

