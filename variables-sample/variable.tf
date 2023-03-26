/* Variables */

variable file_name {
  type = string
  default = "sample.txt"
}

variable content {
  type = string
  default = "Let there be light"
}

variable content_number {
  type = number
  default = 123
}

variable content_boolean {
  type = bool
  default = true
}

variable content_list {
  type = list(string)
  default = ["1", "2", "3"]
}

variable content_tuple {
  type = tuple([string, bool, number])
  default = ["let there be light", true, 2]
}

variable content_map {
  type = map
  default = {name = "Rai Kage", rank = 1}
}