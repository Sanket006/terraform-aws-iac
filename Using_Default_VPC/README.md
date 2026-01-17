# Using AWS Default VPC

This directory shows Terraform examples that deploy resources into the **AWS Default VPC**.

## 🌐 Default VPC Architecture

```
AWS Account
   |
   v
Default VPC
   |
   +--> Subnets
   +--> Route Tables
   +--> Internet Gateway
   +--> EC2 Resources
```

## Use Cases

* Learning and testing
* Simple deployments
* Avoiding custom VPC complexity

---

## Notes

* Using **default VPC** simplifies deployment for testing or small environments.
* Each ALB variant demonstrates increasing complexity from single ALB to multiple pages and ASGs.
* Use **separate ASGs per page** for better isolation and scaling control.

