# Google Cloud LAMP Stack Deployment

This project demonstrates how to deploy a LAMP stack on Google Cloud using Terraform. The LAMP stack supports an online retail business that can be used for penetration testing by red/blue teams.

## Infrastructure Overview
- **VM instance**: Debian-based virtual machine running Apache, MySQL, and PHP.
- **Firewall**: Open ports for HTTP (80), SSH (22), and MySQL (3306).
- **VPC Network**: Custom VPC and subnetwork.

## Prerequisites
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and authenticated.
- Terraform installed.

## Steps to Deploy
1. Clone this repository.
2. Modify `variables.tf` to set your project ID, region, and zone.
3. Initialize Terraform:
    ```bash
    terraform init
    ```
4. Apply the configuration to create the infrastructure:
    ```bash
    terraform apply
    ```

5. Get the public IP of the LAMP stack VM from the Terraform output.

Access the PHP info page in your browser by visiting `http://<vm_public_ip>/info.php`.
