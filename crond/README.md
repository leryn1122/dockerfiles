# Crond Image

## TL;DR

A base image, built on `alpine`, runs a single cron job using `crond` for those cases where the deployment
is conflicting with Kubernetes `CronJob`, for example, a `DaemonSet` with a schedule task on Kubernetes nodes.

All you need to do is write a script on business without schedule tasking.
