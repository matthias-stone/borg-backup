# Matthias' backup system

We're adults who no longer want to depend on rsync, we now use `borg` to maintain backups

- Append only, resistant to ransomware
- Snapshots across time



## Deployment

### Client systems

- systemd for job scheduling and monitoring
- SSH for remote access

### Destination system, `mruniverse`

- Files stored on mruniverse
- Per-repo user & file permissions
- Per-repo/accessor ssh keys
- SSH users can run one command (with append set)



## Repositories - berlin, pazu

### Common - `/home/matthias/Pictures`, `/home/matthias/Videos`

These repositories are shared on systems that have them. Too much (6TB) that's very worth de-dupping.
- $100's of dollars of storage savings
- Substantial reduction in bandwidth usage
- Faster backup sync on whichever system runs second
- Only drawback is parallel backups are not allowed

### Home - `/home/matthias`

Do not include
- `/home/matthias/Pictures` - Common
- `/home/matthias/Videos` - Common
- `/home/matthias/devel/clients` - Separate
- `/home/matthias/.local/share/Steam/steamapps/common` - Huge, changing files. Fine, we're not a bulwark against steam going away.

### Clients - `/home/matthias/devel/clients`

- Best to have separate for legal reasons
- Simplifies scrubbing client sensitive data if necessary
- Might want a rotation policy instead of infinite append
- Measure portion of storage (not value) used for business
- Might by highly dynamic, may need to reduce size



## Repositories - All

This includes mruniverse themselves.

### System

- Maybe the installed package list?
- `/etc`?
- Definitely not /var/lib/docker :haha:

## Repositories - grumpytoast

### Storage - `/srv/storage`

This is an offsite clone of James' NAS. Anything he needs to encrypt for himself is done clientside.

## Open questions

- Different media backup
- How to locally backup mruniverse
- Phone, alternative devices
- Recoveries
