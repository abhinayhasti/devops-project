# SQS Queue Module

This Terraform module creates both FIFO and Standard SQS queues.

## Features

- **FIFO Queue**: First-In-First-Out message queue
- **Standard Queue**: Standard message queue
- **Content Deduplication**: Automatic for FIFO queue

## Resources Created

1. `aws_sqs_queue` (queue) - FIFO queue: MyWhizQueue.fifo
2. `aws_sqs_queue` (queue2) - Standard queue: MyWhizQueue

## Queue Types

### FIFO Queue
- **Name**: MyWhizQueue.fifo
- **Order Guarantee**: Messages processed in exact order
- **Deduplication**: Content-based automatic deduplication
- **Use Case**: Order-critical workflows

### Standard Queue
- **Name**: MyWhizQueue
- **Throughput**: Nearly unlimited
- **Delivery**: At-least-once delivery
- **Use Case**: High-throughput messaging

## Usage

```bash
terraform init
terraform apply
```

## Use Cases

- Microservices communication
- Event-driven architectures
- Job queuing systems
- Decoupling application components

## Cleanup

```bash
terraform destroy
```
