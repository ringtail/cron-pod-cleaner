# cron-pod-cleaner
cron clean up pods that match status and namespaces.
```
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: cron-clean-up-pods
spec:
  schedule: "*/15 * * * *"
  failedJobsHistoryLimit: 1
  successfulJobsHistoryLimit: 1
  concurrencyPolicy: Replace
  jobTemplate:
    spec:
      completions: 1
      backoffLimit: 1
      template:
        spec:
          serviceAccountName: cron-clean-up
          containers:
            - name: cron-clean-up
              image: ringtail/cron-cleanup-pod:0.1
              imagePullPolicy: IfNotPresent
              args: ["OutOfcpu|OutOfmemory","default"]
          restartPolicy: Never

```