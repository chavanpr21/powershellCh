 Requires module ThreadJob #(preinstalled in v6+)

# Start the thread job, always asynchronously.
$threadJob = Start-ThreadJob { Write-Host "this is scriptblock" ; 'done' }

# Wait in a loop and check periodically if the job has terminated.
Write-Host -NoNewline 'Doing other things..'
while ($threadJob.State -notin 'Completed', 'Failed') {
  Write-Host -NoNewline .
  Start-Sleep 1
}
Write-Host

# Get the job's success output.
"result: " + ($threadJob | Receive-Job -Wait -AutoRemoveJob)