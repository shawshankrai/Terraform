terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.1"
    }
  }
}

provider "random" {
  # Configuration options
}


resource "random_integer" "random_provide_int" {
  max = 11
  min = 1
}