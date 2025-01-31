# Disable suspend or hibernate mode
- Sometimes server goes to sleep mode when there is no input. So disabling it is required.

## Check current status
`sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target`


## Disable 
`sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`


## Enable
`sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target`


## Verify change
`sudo systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target`