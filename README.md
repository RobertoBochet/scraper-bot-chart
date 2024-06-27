# Scraper Bot Helm Chart

[![GitHub](https://img.shields.io/github/license/RobertoBochet/scraper-bot-chart?style=flat-square)](https://github.com/RobertoBochet/scraper-bot-chart)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/RobertoBochet/scraper-bot-chart/release.yml?label=publish%20chart&style=flat-square)](https://github.com/RobertoBochet/scraper-bot/pkgs/container/scraper-bot-chart)

This repo provides the helm chart for the [Scraper Bot](https://github.com/RobertoBochet/scraper-bot)

The chart setups the required [`redis`](https://redis.io) server and it creates a [`CronJob`](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) to run the bot periodically

## Deploy

Helm chart package is available in the github OCI registry
```
oci://ghcr.io/robertobochet/scraper-bot-chart
```
You can use it to directly deploy on your kubernetes cluster
1. Retrieve the default values file
   ```shell
   helm show values oci://ghcr.io/robertobochet/scraper-bot-chart > values.yaml
   ```
2. Customize the `values.yaml`
3. Install the scaper bot
   ```shell
   helm install scraper-bot oci://ghcr.io/robertobochet/scraper-bot-chart -f values.yaml
   ```

## Configuration

For the Scraper Bot configuration you have to look at the main repository [`scraper-bot`](ttps://github.com/RobertoBochet/scraper-bot)
