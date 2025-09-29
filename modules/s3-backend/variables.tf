variable "bucket_name" {
    description = "Globally unique name for the S3 bucket"
    type = string
}

variable "object_lock_enabled" {
    description = "Enable object lock for the S3 bucket"
    type        = bool
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. If versioning is enabled, this also deletes all versions of all objects in the bucket."
  type        = bool
}



