```
NOTE: DigitalOcean has not yet released a Debian 11 image. Until then, please manually update all servers to debian 11 prior to running the ansible package.
```

# Deploying ComputeStacks on Digital Ocean

Create a `terraform.tfvars` file and adjust the settings appropriately. Specifically, you will:

* Choose the appropriate package for your servers
  * _NOTE:_ The packages set as the default in the `terraform.tfvars.sample` meet our minimum requirements. We do not recommend going below those, as that may prevent ComputeStacks from booting.
* Specify how many nodes you want (we recommend 1, 3, or 5). If you need more resources, consider increasing the plan size, or creating multiple availability zones.
* Choose your region

Additionally, please ensure the DigitalOcean project is created prior to running this package.

## Setup Terraform

Before proceeding, ensure you have [terraform installed](https://learn.hashicorp.com/tutorials/terraform/install-cli), and then run:

```bash
terraform init
```

## Running Terraform

```bash
terraform apply
```

After terraform runs, you will see 2 newly created files under the `result/` directory.

1. `dns_settings.txt` | Your DNS settings, which must be applied prior to running the ansible package.
2. `inventory.yml` | You will need this later when configuring Ansible.

## Before Running Ansible

During the initial boot process of your new droplets, ansible will be installed. This can take a few minutes to complete. 

Please ensure that this process has completed _before_ running the ansible package. You can verify that this is completed by: `tail -f /var/log/syslog`

For either distribution, you're waiting to see Ansible finish installing. This will be the last step.

You can also confirm the process has completed by ensuring `which ansible` is successful.

## Find Digital Ocean Resources

You can use [direnv](https://direnv.net/) to safely store environmental variables locally in this directory.
Once [direnv](https://direnv.net/) is installed:

  1) `mv .envrc.sample .envrc`
  2) add your digital ocean token, and;
  3) `direnv allow .`.

We also recommend installing [jq](https://stedolan.github.io/jq/) to aid in the presentation of the json data.

### List available plans

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/sizes" | jq
```

### List all regions

```
curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $DO_TOKEN" "https://api.digitalocean.com/v2/regions" | jq
```
