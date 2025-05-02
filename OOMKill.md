# Responding to OOMKilled Pods in Kubernetes
## Purpose
This runbook defines the immediate and structured response when Kubernetes pods are repeatedly terminated due to Out Of Memory (OOMKilled) errors under production or staging workloads.

### Scope
Applies to all Kubernetes clusters.

### Symptoms
- Pod restarts with OOMKilled status.

- CrashLoopBackOff events following OOMKilled.

- Service degradation or outage reported.

### Immediate Response
1. Confirm the Problem

#### Inspect pod status:

```
kubectl get pods -n <namespace> --field-selector=status.phase!=Running
```
#### Check for OOMKilled termination reason:
```
kubectl describe pod <pod-name> | grep -i "OOMKilled"
```
2. Identify Affected Workloads
- Find which Deployment, StatefulSet, or DaemonSet owns the pod:

```
kubectl get pod <pod-name> -o jsonpath='{.metadata.ownerReferences[0].name}'
```

3. Triage Resource Usage
- Check recent resource usage (if Metrics Server or Prometheus is installed):

```
kubectl top pod <pod-name> -n <namespace>
```

Estimate if memory usage exceeded current limits/requests.

4. Immediate Stabilization Actions

| Action                         | When to Apply                                                      | How                                                                                       |
|-------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Increase Memory Requests and Limits | If memory usage is consistently breaching limits.                 | Update Deployment YAML: `resources.requests.memory` and `resources.limits.memory`.        |
| Scale Out Replicas            | If workload can be horizontally scaled.                            | Increase replica count in Deployment spec temporarily.                                     |
| Add Node Capacity (Emergency) | If many pods are OOMKilled due to node-level memory pressure.      | Provision additional nodes manually or via auto-scaling group.                            |


5. Patch and Deploy
- Patch the Deployment to increase resource requests/limits:
```
kubectl edit deployment <deployment-name> -n <namespace>
```

OR, preferably, update GitOps source (Helm chart / Kustomize / YAML) and redeploy.

6. Monitor Recovery
- Watch pods come back online:

```
kubectl get pods -n <namespace> --watch
```

Validate memory usage post-deployment:

```
kubectl top pod -n <namespace>
```

Confirm service health (application-specific tests, HTTP probes, etc.).

Root Cause Analysis (Post-Recovery)
- Once immediate stability is achieved:
    - Analyze why original memory limits were insufficient.
    - Review load profiles and memory usage trends.

Consider:
- Tuning JVMs, application memory settings.
- Implementing Horizontal Pod Autoscalers.
- Upgrading instance types or cluster node pools.
- Document findings for future preventive actions.

>Notes
- Always aim to patch at the GitOps source level — live kubectl edit is acceptable for emergencies but must be reconciled back to source.
- Resource tuning should be reviewed periodically after launch and during performance testing phases.