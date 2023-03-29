
# Usage: resource.random_string.rnd_suffix.result
resource "random_string" "rnd_suffix" {
  length           = 6
  special          = false
  lower            = true
  upper            = false
}

