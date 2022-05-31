variable "TAG" {
    default = "latest"
}

variable "REPO" {
    default = "larssonoliver/larssonoliver.com"
}

group "default" {
    targets = ["larssonoliver.com"]
}

target "larssonoliver.com" {
    context = "."
    dockerfile = "build/package/Dockerfile.buildx"
    platforms = [
        "linux/amd64", 
        "linux/arm/v7", 
        "linux/arm64",
    ]
    tags = [
        "${REPO}:latest", 
        "${REPO}:${TAG}",
    ]
}
