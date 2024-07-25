include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../modules/service_account"
}