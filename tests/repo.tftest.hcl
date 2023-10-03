variables {
  name                         = "test"
  business_unit                = "modules"
  tfc_workspace_infrastructure = "terraform-aws-postgres-waypoint-test-setup"
}

provider "aws" {
  region = "us-west-2"
}

provider "github" {}

run "repository" {
  command = plan

  assert {
    condition     = github_repository.app.visibility == "public"
    error_message = "Starter repository should be public for Argo CD"
  }
}
