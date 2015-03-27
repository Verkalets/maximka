working_directory "/home/deploy/wifi/current"

pid "/home/deploy/wifi/shared/pids/unicorn.pid"

stderr_path "/home/deploy/wifi/shared/log/unicorn.log"
stdout_path "/home/deploy/wifi/shared/log/unicorn.log"

listen "/home/deploy/wifi/shared/system/unicorn.backmy.sock"

worker_processes 2

timeout 30
