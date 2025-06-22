# 🧩 Media Server GitHub Project Snapshot

A summary of tracked tasks pulled from TODO.md, structured for visibility and planning.

| Priority        | Task                                                                                      | Status / Notes                             |
|-----------------|-------------------------------------------------------------------------------------------|--------------------------------------------|
| 🔧 High         | Finalize qBittorrent category integration                                                 | ⏳ In Progress                              |
| 🔧 High         | Connect Radarr/Sonarr/Lidarr/Readarr to qBittorrent (Download Clients)                   | ⏳ In Progress                              |
| 🔧 High         | Test full media pipeline: search → download → organize → Jellyfin                        | 🟡 Waiting on qB                            |
| 🔧 High         | Fix Prowlarr indexer/app integration errors                                               | 🟡 Partial                                  |
| 🔧 High         | Confirm and set root folders in all *Arr apps (`/mnt/media1tb/{media}`)                   | 🟡 To verify                                |
| 🔧 High         | Enable Fail2Ban filters for qBittorrent & optionally Jellyfin                             | 🟡 Optional                                 |
| ⚙️ Medium       | Configure Jellyseer UI                                                                    | Container running                           |
| ⚙️ Medium       | Add `/books` library in Jellyfin                                                           | Directory exists                            |
| ⚙️ Medium       | Migrate older media from `/mnt/mediausb` into `/mnt/media1tb`                             | For music/books                             |
| ⚙️ Medium       | Add logs/email alerts for stuck *Arr jobs                                                 | Optional                                    |
| ⚙️ Medium       | Create/validate download test folders                                                      | Optional                                    |
| ⚙️ Medium       | Document Docker config backup & export                                                     | Optional                                    |
| 🧊 Low          | Set up Traefik routing + Cloudflare tunnel                                                | After core config                           |
| 🧊 Low          | Configure Jellyfin metadata agents                                                         | Optional                                    |
| 🧊 Low          | Standardize naming in Radarr/Sonarr                                                        | For cleanup                                 |
| 🧊 Low          | Plan NAS expansion / optimize volume sizes                                                 | Optional                                    |
| 🧊 Low          | Explore Usenet integration                                                                 | Nice-to-have                                |
| 🧊 Low          | Monitor zombie processes                                                                   | Occasionally seen                           |
| 🚨 Needs Action | Re-authenticate Tailscale                                                                  | `tailscale up --authkey`                    |
| 🚨 Needs Action | Enable and start `tailscaled`                                                              | `sudo systemctl enable --now tailscaled`    |
| 🚨 Needs Action | Manage ethernet with NetworkManager                                                        | `nmcli device set enp4s0 managed yes`       |
| 🚨 Needs Action | Decide on Wi-Fi interface disablement                                                      | For clarity                                 |
| 🚨 Needs Action | Remove `docker.io` if `docker-ce` present                                                  | Reduce conflict                             |
| 🚨 Needs Action | Replace NGINX with Traefik + HTTPS                                                         | Already in stack                            |
| 🚨 Needs Action | Automate video compression                                                                 | Cron/inotify option                         |
| 💡 Optional     | Add swap or RAM upgrade                                                                    | 1.7GiB is low                               |
| 💡 Optional     | Resize root LV if overallocated                                                            | 455GB mostly free                           |
| 💡 Optional     | Enable Docker log rotation                                                                 | Or systemd journal caps                     |
| 💡 Optional     | Harden SSH                                                                                 | Disable password, root, add UFW             |
| 💡 Optional     | Confirm unattended-upgrades include Docker & kernel                                        | For security                                |
| 💡 Optional     | Add HTTPS to Jellyfin (self-signed or via Cloudflare)                                      | Optional TLS                                |
