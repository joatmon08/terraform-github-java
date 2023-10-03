resource "github_repository" "app" {
  name        = var.name
  description = "${var.name} - a Java app"

  visibility = "public"

  template {
    owner                = var.owner
    repository           = var.template_repository
    include_all_branches = false
  }
}