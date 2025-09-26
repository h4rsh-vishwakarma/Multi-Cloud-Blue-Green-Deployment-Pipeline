variable "env_color" {
  description = "Deployment का रंग (blue or green)."
  type        = string
}

variable "docker_image_tag" {
  description = "Deploy करने वाली Docker image का टैग।"
  type        = string
}