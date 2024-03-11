
# IaC
The IaC for the creation of the environment.

We are going to save here the Terraform and Ansible code. We are going to implement modules and the deploy in the same repository.

We are going to implement the Ansible here too, but by Dec/2023 we dont know what we will use with Ansible.

## doc

In this folder we have the information of the project.

- Architectural design


## iac/terraform

- **account-master:** Code to deploy the master account environment
- **modules:** the code converted to modules, in the final stage every other folder will only use modules created inside here

## Tools

- **infracost:** Install process [quick-start](https://www.infracost.io/docs/#quick-start)
<!-- - **trivy:** install process [quick-start](https://aquasecurity.github.io/trivy/v0.49/getting-started/installation/) -->
- **tfsec:** install process [quick-start](https://github.com/aquasecurity/tfsec)

## helper

- **makefile:** in Root folder there is a makefile with commands

## License

**Ops Life © 2023 by Dionizio Alves Ferreira is licensed under CC BY-NC 4.0. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc/4.0/**


## Aditional itens

**Other tech to consider:**
- https://www.puppet.com