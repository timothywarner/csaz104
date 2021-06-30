# AZ-104 Classroom Scenarios.

## Case Study: The Buffalo Project

We opened a new office in Buffalo, NY and need to stage access for Buffalo-based employees. We just hired a new Buffalo-based developer named Lexi Gamlen. She needs to deploy her Node web app to VMs and App Service, with AKS on the longer-term roadmap.

## Scenario 1: Identity, Access, and Governance

* New office: Buffalo, NY
  * Buffalo Users groups/AUs
  * New dev: Alexa Gamlen (alexa@timw.info)
  * Apps, O365, AZ104App
  * Able to register apps
  * SSPR, MFA, Conditional Access

* Alexa needs Contributor to AZ104 resource group
  * JIT Contributor at subscription scope
  * Policy
  * East US region only
  * class:az104 tag

* Alexa needs a storage account
  * Security
  * Availability
  * Data protection
  * Cost optimization

## Scenario 2: Networking and Compute

* Virtual network
  * Template deployment
  * Delegated subnets
* VM deployment
  * 2 web servers needed
  * CSE Extension
  * TCP/IP configuration
  * Bastion access
* Protection
  * Backup / replication
  * NSGs
  * Azure Firewall / routing
* Load balancing
  * LB & App GW for web servers to compare
* PaaS app testing
  * App Service
  * ACI/AKS
  * Integration with App Gateway

## Scenario 3: Monitoring

* Troubleshooting VM access
  * Network Watcher
  * Connection Monitor 2.0
* Enabling diagnostics
  * Monitor
  * Log Analytics
* Monitoring resources
  * KQL
  * Alerts / Action Groups

