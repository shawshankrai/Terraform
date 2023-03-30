resource "random_integer" "random_integer_lc" {
  max = 300
  min = 12

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [min]
  }
}