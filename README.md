# Scraper Bot Helm Chart

[![GitHub](https://img.shields.io/github/license/RobertoBochet/scraper-bot-chart?style=flat-square)](https://github.com/RobertoBochet/scraper-bot-chart)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/RobertoBochet/scraper-bot-chart/release.yml?label=publish%20chart&style=flat-square)](https://github.com/RobertoBochet/scraper-bot/pkgs/container/scraper-bot-chart)
[![GitHub Latest Release Version](https://img.shields.io/github/v/release/RobertoBochet/scraper-bot-chart?sort=semver&display_name=release&style=flat-square)](https://github.com/RobertoBochet/scraper-bot-chart/releases)
[![Static Badge](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/scraper-bot&style=flat-square)](https://artifacthub.io/packages/helm/robertobochet/scraper-bot)

This repo provides the helm chart for the [Scraper Bot](https://github.com/RobertoBochet/scraper-bot)

The chart creates a [`CronJob`](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) to run the bot periodically

## Deploy

1. Add the repository to helm
   ```shell
   helm repo add robertobochet https://robertobochet.github.io/charts
   helm repo update
   ```
2. Retrieve the default values file
   ```shell
   helm show values robertobochet/scraper-bot > values.yaml
   ```
3. Customize the `values.yaml`
4. Install backrest
   ```shell
   helm install scraper-bot robertobochet/scraper-bot -f values.yaml
   ```

## Configuration

For the Scraper Bot configuration you have to look at the main repository [`scraper-bot`](ttps://github.com/RobertoBochet/scraper-bot)

## Parameters

### Common parameters

| Name               | Description                                        | Value |
| ------------------ | -------------------------------------------------- | ----- |
| `nameOverride`     | String to partially override common.names.fullname | `""`  |
| `fullnameOverride` | String to fully override common.names.fullname     | `""`  |
| `imagePullSecrets` | Secret to use for pulling the image                | `[]`  |

### Image

| Name               | Description                                                   | Value                       |
| ------------------ | ------------------------------------------------------------- | --------------------------- |
| `image.registry`   | image registry, e.g. gcr.io,docker.io                         | `ghcr.io`                   |
| `image.repository` | Image to start for this pod                                   | `robertobochet/scraper-bot` |
| `image.tag`        | Visit: Image tag. Defaults to `appVersion` within Chart.yaml. | `""`                        |
| `image.pullPolicy` | Image pull policy                                             | `IfNotPresent`              |

### Security

| Name                       | Description          | Value |
| -------------------------- | -------------------- | ----- |
| `podSecurityContext`       | Pod security context | `{}`  |
| `containerSecurityContext` | Security context     | `{}`  |

### CronJob

| Name                                 | Description                                                                                         | Value       |
| ------------------------------------ | --------------------------------------------------------------------------------------------------- | ----------- |
| `cronJob.schedule`                   | Defines how often the job has to run. It uses the [Cron syntax](https://en.wikipedia.org/wiki/Cron) | `0 * * * *` |
| `cronJob.failedJobsHistoryLimit`     | Specifies the number of failed finished jobs to keep                                                | `1`         |
| `cronJob.successfulJobsHistoryLimit` | Specifies the number of successful finished jobs to keep                                            | `1`         |
| `cronJob.concurrencyPolicy`          | Specifies how to treat concurrent executions of a Job that is created by the CronJob                | `Replace`   |

### Job

| Name           | Description                                                                                                                                       | Value |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ----- |
| `resources`    | Kubernetes resources                                                                                                                              | `{}`  |
| `nodeSelector` | NodeSelector for the job                                                                                                                          | `{}`  |
| `tolerations`  | Tolerations for the job                                                                                                                           | `[]`  |
| `affinity`     | Affinity for the job                                                                                                                              | `{}`  |
| `config`       | Defines the config of the scraper bot in yaml syntax. Refer to [main project for the documentation](https://github.com/RobertoBochet/scraper-bot) | `""`  |

### diskCache

| Name                                  | Description                                           | Value               |
| ------------------------------------- | ----------------------------------------------------- | ------------------- |
| `diskCache.enabled`                   | Enable diskCache                                      | `true`              |
| `diskCache.persistence.existingClaim` | Use an existing claim to store repository information | `""`                |
| `diskCache.persistence.size`          | Size of the pvc                                       | `2Gi`               |
| `diskCache.persistence.accessModes`   | AccessMode for persistence                            | `["ReadWriteOnce"]` |
| `diskCache.persistence.storageClass`  | StorageClass for the pvc                              | `""`                |

### redis

Redis and DiskCache cannot be enabled at the same time.

| Name                                    | Description                              | Value        |
| --------------------------------------- | ---------------------------------------- | ------------ |
| `redis.enabled`                         | Enable redis standalone or replicated    | `false`      |
| `redis.architecture`                    | Whether to use standalone or replication | `standalone` |
| `redis.serviceBindings.enabled`         | Enable redis service-binding secret      | `true`       |
| `redis.master.persistence.enabled`      | Enable persistence storage               | `true`       |
| `redis.master.persistence.storageClass` | StorageClass for the pvc                 | `""`         |
| `redis.master.persistence.size`         | Size of the pvc                          | `2Gi`        |
