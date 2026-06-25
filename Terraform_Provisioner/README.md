# Terraform Provisioners

This directory contains examples of Terraform **provisioners**.

## ⚙️ Provisioner Flow

```
Terraform Apply
      |
      v
Resource Created
      |
      v
Provisioner Executes
(local / remote)
```

## Provisioners Covered

* `local-exec`
* `remote-exec`
* `file`

⚠️ Provisioners should be used only when necessary.

---

## Notes

* **local-exec** → Runs commands on the machine executing Terraform.
* **remote-exec** → Runs commands on the remote resource after creation.
* **file** → Copies files from local to remote resource.
* Provisioners are typically used **after resource creation** and for **configuration tasks**.
