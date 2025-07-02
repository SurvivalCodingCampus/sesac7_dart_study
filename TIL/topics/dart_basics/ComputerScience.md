## Sync v Async

### Synchronous Programming
- wait for one task to complete then start the next task

### Asynchronous Programming
- A task no longer wait for previous tasks' completion, but start
- cannot predict the order of completion
- Mostly for I/O or networking operations that take awhile

## Concurrency v Parallelism
- Two ways to achieve asynchronicity 

### Concurrency
- multiple tasks are **logically** happening at the same time
- different task occupy different time slot and alternate 

### Parallelism
- multiple tasks are **physically** happening at the same time 
- thanks to multicore processors