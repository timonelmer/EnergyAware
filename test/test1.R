# Test 1

cpu.info <- setup_cpu()
start.time <- proc.time()
Sys.sleep(5)
energy_evaluate(cpu.info, start.time, cores = 1)


# Test 2
# test different cpu
test.cpus <- c("Intel(R) Xeon(R) Platinum 8175M CPU @ 2.50GHz",
  "Intel(R) Core(TM)2 CPU 6700 @ 2.66GHz",
  "Intel(R) Xeon(R) CPU X5550 @ 2.67GHz",
  "Intel(R) Xeon(R) CPU E5-2665 0 @ 2.40GHz",
  "intel i5 2509",
  "Itanium 9120"
  )

sapply(test.cpus, function(i) setup_cpu(cpu.model = i)[[2]])
